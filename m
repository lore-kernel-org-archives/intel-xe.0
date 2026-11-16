Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB750606A323
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 09:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f41v8ePm;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=mNab38rv
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BBF910EE2C;
	Mon, 16 Nov 2026 09:46:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80CE210EE05
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 09:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794822358; x=1826358358;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=jJdIP6m8nHDKhDM47OrsBQeo+wNOMa5w70VtDT8kzqs=;
 b=f41v8ePmp64mvHR7tRKNaUxBUTG57RsjJM0q5YBAnKzq7Ro/2c7Aawlg
 jBDyyZ/ntaMTCBLGI4kwbhV40CQsieqODvyTvefKpvv0KAzvKL5va9Q+p
 e9sBiPsv4r2ceco/0lhhe8WFqyz2ai4qpK3UGJHymDleGwRj0lwo9iIB0
 1IhVB68GXPAQEZ1WVAlMbZKMhn3Cxuu7qxjs/MMLjpVA8PCH1krLql/YO
 UcAYBewYU4ZTxM3XbaENtrRHvDl/jAPG6F99ulhkN4VuenSqDnT65227S
 qSIQtboulXLN28iGDt0vu1eHkym0jb/J86oEQiOjCxxXLwdklu/jpidUy w==;
X-CSE-ConnectionGUID: Sa6U1eyiQzudkUIx2o4DAQ==
X-CSE-MsgGUID: syeBKKqwQ1KuZAwpuAp33g==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3549639"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3549639"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 01:45:46 -0800
X-CSE-ConnectionGUID: HHgpOcQ/T6a6raivmrVoog==
X-CSE-MsgGUID: G5P8wrgHRiCyHM6HQWAvCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9697799"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 01:45:46 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 01:45:45 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 16 Nov 2026 01:45:45 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.49) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 01:45:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YtQKrjolCi7oqLTABIDxleHiCqsoZOMwxIvqeSl04XNh7rHvc/jgny51P0/lQ7uC85IzTh2zHVfINUTPeRaeC0H1q9xoZ6AO9l0o2uiqmmBDMz3d6kZ3RyqJ+2ZkfwM0TDBBABV4nJA7HFwPUT3kEJu87P2C/fH45lrRIJiOPgLX4M3usAjVYHdlrCSL4oFtbEIL5edRqFFjdHUXP0z0aTn/ht2pI8XzFvFv7EjyBNahbVcF3PFtfWvXgNFisXz8d/9QKH281/6gkDwZFi9n+HxnWXbyGRPhXvMu+gQ5s3Mgi2ZcUdEhogsxlZuyvoJZoNeryreTVGtbbWeTxIqORQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0zoYqoJoamu+KhFU+IKSRrh5PVBW1V6V0uS+aA97cP8=;
 b=UGjtE6wjb5WSRcViz6IMJefXpNoLbd0g1hSiZ05oBoorw472KsTThiuQeWsByDJ13Y9VoXQFchfWRpHv+9cJdtc2zZDw7ci6A60uPKabuI2YBWxzJHnyoCkQUz3AfUCPA/n/7C3PsL6X6AZNMm1IubpRvxuN7W89qQZG1yvuzcXLYfXHkV0xAAxN/N/0NZUrOhKAgOD2ufn3m6jJee5GrfaHqtmq0lkTX7iLeLlESuzcAsYyaG/NfFW83fND2FN6umEUqBOugKMso6ieGdhCo0V7KwWG+9KNeIHSCSetpauAkXGlgPT2sCMQT96j6pPuo/8XwnQzqiemOkPRk/sQFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0zoYqoJoamu+KhFU+IKSRrh5PVBW1V6V0uS+aA97cP8=;
 b=mNab38rv/H2+9Dmkni3OF1HyUHJMx5BadyegVn9jduLwipYA2MWoVrv8s15xOfrC03yqZ4gJiIx4cltahmL0nIfXP7exTS87+//4AdwdXv5/0n/2vhiGpR/DNIxm22y8InatRHFVZBGB/x9a9EkqyOgXnpAWQpiUNbLdAxmEGY0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by IA3PPFED21B01E3.namprd11.prod.outlook.com
 (2603:10b6:20f:fc04::cd) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 09:45:43 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%3]) with mapi id 15.21.0615.012; Mon, 16 Nov 2026
 09:45:43 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v4 3/7] drm/xe/vram: Make VRAM pools the allocation handle
Date: Mon, 16 Nov 2026 10:45:19 +0100
Message-Id: <20261116094523.2484301-4-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116094523.2484301-1-piotr.piorkowski@intel.com>
References: <20261116094523.2484301-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIUP296CA0078.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:349::16) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|IA3PPFED21B01E3:EE_
X-MS-Office365-Filtering-Correlation-Id: 7059baca-07d2-461c-5de2-08df43c661d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|18002099003|22082099003|6133799003|11063799006|5023799004|56012099006|10067099003|261022105027099003|261028144727099003|261026121527099003|261021135927099003|261021123027099003|261021121427099003|261009221727099003|261009223027099003|261009221227099003|261009223327099003|261009220027099003|261102123227099003|261102130727099003|261026140227099003|260925021311599003|260925022911599003|260925021911599003;
X-Microsoft-Antispam-Message-Info: 0VSzZbcOsi1jgJiQBVaNfTx3VaRIU7b2s8V44YqfaPNPm837P+tbTjX6Pg/OP6q9qz/9TEUzgHP9pIphDBtRR4wfyJLrMvNvK5fIZ3CAMtGqZX7lsKYxp7xYz6YMaKMKCVlT6PXzQ2H1xSs+NqOu2jrkqgjaFrT0xXt1E9tRHy88SKkKuXaNOEyDnW4grCySZEgTyfq99sLDqaZXhjKD26NrE3A2ufjOF4VKO59DXeDp7GpvaeqGHuWlPqfs56nQvVqfJI4wAIiR1W33i3Tp+IAeZXYlonPeFlgIss6CiAsXfZM5NoqcQzMrbbpgfdJ5J/0TiRGctljo8EyhBc1yY2PMrjGePqHKYMPK3mkNXzzugSiOAzk5ULp37ibLwLrcPlUZYhKbikJmZEe/bAKFrApuQ10QM6DfV3G40QHxqu81cbi9Dj4uVCrRfEga1lvGKKmfyAEB/FM8xX45B56ip+s20rhDGrrAPkyMm1YFxgVCuqCNyzII9qcW1Bq1fr8RzaLbR1NZ0lTgNHys0+c0o8cwiJpDwRSqNOBEzOSRbF6nlUfuUun7kJsyjWI7eMHuXDYwvP1wNuQZBB5Kkbij7GpDsVhPUgQ6u+FdQHwGyqS3gRjq+HUXnXBfXD8k2rDgfIduXy4Gzr0CKECi4o7F+eOkMjt8PPBSWUA5eDMd8OU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(18002099003)(22082099003)(6133799003)(11063799006)(5023799004)(56012099006)(10067099003)(261022105027099003)(261028144727099003)(261026121527099003)(261021135927099003)(261021123027099003)(261021121427099003)(261009221727099003)(261009223027099003)(261009221227099003)(261009223327099003)(261009220027099003)(261102123227099003)(261102130727099003)(261026140227099003)(260925021311599003)(260925022911599003)(260925021911599003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWxjVEtVc1ZUaVFXYlFySTdLSmxIeitZdWRDTjhhZGhnb0RxWkI3VEpGM1lu?=
 =?utf-8?B?dmN4VXpNWHgzK0VZb21lQlpJRVFHdWpoUHR6ck13V3ZERnlDajhmRVc2NEx3?=
 =?utf-8?B?TncwTFRHQzFCMVlvSmdRcndlWDZsZUFJaEZLeGNJZWJWYnRKNVV3LzZxN2tJ?=
 =?utf-8?B?a0Z1OE82NUpWd2RrYm5rRkw3c09HM3VvcHR5RzNiZFJOOUVNZ3kxSEJ1S3pX?=
 =?utf-8?B?eXRvMnJvVEFtWm1ZSGFGN292R3Qvd3V6SnBibVRLQzBHYTVMSUo2dEhON2Fp?=
 =?utf-8?B?TWFkT3dqdTZRL2dHc0E4dVJNVU51aGJxYkEvcWQzLzVZQ0VKcGRsZGVuc3Vl?=
 =?utf-8?B?RCtlRkViM3h5Yk5Gd1dMaDEwbUxIZGZud1BTdlNZcnd5L25ZNXExUVB4a2Z0?=
 =?utf-8?B?MmpFQXlrSWc0enN0SWFSbUp0Y05TaER5ZVIvdGVubEFCNFJyMkdMVDVYcWRP?=
 =?utf-8?B?NXNlWGJTZlJkNnlRZ21MVWdxUEZPLzhJb3pBcDdFQkdsejJ6cFBTakkyQUQ2?=
 =?utf-8?B?NllTWDZmOWY4YnBremJOZGJ1bEl5Z3lqWC9YdEhQcitneDE3SG1UdUkzTWhO?=
 =?utf-8?B?d0JqU1QvK3RkMjFjd2VFbTlXQ2pXSVVZQXB6K3lLbzJodEZEQ0ZLL1MzMWhz?=
 =?utf-8?B?NEVNQU1YdzlNaHh6Sm1naHRDUFVGRVR6Nlk3aS9zcDNVb3BlZXJiWFNLV2RH?=
 =?utf-8?B?cHc4TjhKRU9ENjk5OTJkVElaT1RZRHhhMFRqMWxoTVlOZkhleWtyWHV3dUs5?=
 =?utf-8?B?L3pMOHNnSHd6aG5zQUtKTUxMcFZWVDBmc3BnekV1NjlLZWJ1dnJYOHd5Umds?=
 =?utf-8?B?Qm5nTUcvamZGVU0vclRqTGRiY0FMcTRqcW5YUzhCTUdPRE15VnBXd0lGRE9n?=
 =?utf-8?B?Rkt1VXZVbHVDRTFMaS8wd0haSVl1RUt6QUNLWC9ocjNRU3RaS1pjTHdzQm9v?=
 =?utf-8?B?RlJlQXNlbGtaRWcyVnFTZ3Yya2R6SElZcWVZbmwxb04yakJ4K09uSGpLdXRz?=
 =?utf-8?B?aWdzSkRrSnJZL2U0dmx3SVJETnYvekJTRFlTSlZGLzRFM1lqdGU1bDdUK0V3?=
 =?utf-8?B?S3F3ZUVxZ0x3aEMxNXJLaExibGRuemRnZ3ZNYWxVSDBkMTFzL1kvdVNGNkx2?=
 =?utf-8?B?TDJvTkEyejNWWnlCdjZxKzlCeUFCbXdUN0RwekZJaC95Tk4vRWZJQzJmSkl0?=
 =?utf-8?B?WDVsZ05sdUpFT2hNVk83cVlIQVVPNis0VTlXVkFiOW1zMTdYQ1dXbnFUOWRp?=
 =?utf-8?B?c3J5QzF3TXZpRUpYUkhFci93djYwNmpIeUwrS3pTWU1QSG9XMm4yY2ZLMXF0?=
 =?utf-8?B?VlMrRjAxblJVWTNzWkdzMytuTmY3cVZZVmRBbFp0T1MzbitoRTRaMW12ZDNV?=
 =?utf-8?B?R2wyb1ozdTVCbXFOVHBVdzljVmEyay9xOWdjMUdGazR1a2Z3TExlVGVWSmZs?=
 =?utf-8?B?NURydnN2dWk3a2tYa3l5VXNyTWtGMEIvQzEyNmk5REFPVmtNWUFiMjV1ZXEw?=
 =?utf-8?B?dDFJZTFDVlpaUTJiVDM2S3JhcFF3SGVPQnQ3RUlvYm54UCtGNVd4eVhzck52?=
 =?utf-8?B?R0UzV2xvVnBQcTI1aDJkVGZYeXZabnZhNUlVNkhCUEVZcG1NY3lNM3plV0hq?=
 =?utf-8?B?eDlqWG1FZWxsc2xpVWRRdjBOTzNyUDFJWC9abmswT2dVeUoxc3g2T05YYmtN?=
 =?utf-8?B?VVlQcldaMDRvMUZiaWZ4WFdmaHoxYXA3NDBZVUlmUjRoN0wxaVpOdXk5WExQ?=
 =?utf-8?B?ZjBacDNLZzNhYTgyNUw4QTN6UmpRVUJnK3NTWUw2c2RTODFzNWFjMEowVUxE?=
 =?utf-8?B?UHB5YXRGbWhtY2RZVHFFRlJqZ0l2ZzlaY0RpNFFhTCtPck1JaHM0d2dBVWJS?=
 =?utf-8?B?VWRkUkNKMzI1L0xWNFBSZlV4ZktpeDd2UW41K2xKOEhzRTdNMDhyK2E5eWY0?=
 =?utf-8?B?Q1M0K2pjU1dtTVNvWWJ2M0VNTWwwTUJnNnlBVWpESUxPZXFmdVlHaXJKZTVH?=
 =?utf-8?B?ZTVqL1VmY3BwL0R3STBlV0Q4MTkweXhsQlhpeW04Zm1mYVlta3RwSnY5UGhC?=
 =?utf-8?B?Yk9YeTJmYnE2a001UWdZL25oVndxb3pwZER5ZEZMUmlQNGQyOGZLOGRXVHBp?=
 =?utf-8?B?Z1hWb2MxbGkwZGxzVkhHelcxcmw5L2FFUzBxc3U2LzF3NlJOcEszaVVzQVNz?=
 =?utf-8?B?RmVEcHRqaEUvQ0h2Vnc1YzZZWVdyczR6dmNmYm8wM1dQSHlacFpGeGNhLzlV?=
 =?utf-8?B?Y0RYUzdLdnJyYXdkd1lMd0VWL2JSU09uMmlwUDVpTXJUT2o2NUZWK3Y2STNH?=
 =?utf-8?B?RmEreGxVODU3QmVHZzZYT3ZOY2ZyRHFmUTRFNEtaL0pLREZRS1pyR1VZRTQw?=
 =?utf-8?Q?80HEtCGoQlVuCtTo=3D?=
X-Exchange-RoutingPolicyChecked: kfXPn0Y89eHioh+FSyjSOyGtHOwNyc0tWdzzyP/nEHR79tfh8cErvXwpQOgktGfqzYQp8YEa6a9tNFglyXu433i3GnRC96I4/sWqKozdGVpMtVTzxEn6ArXzkc6dP4Iq6L9slKq+xaQ//rKZRs4FVsl8E6SU+Aicb/sxFt29Bmn+pwyD84KYNFp6/a56mlqJt9yDYe0q6f01370dvXBrjySpKZQScwkgwaT8PLnTZDYlFygB/O0X8kMbU+QY5F66+MWeat68IJnyOvkD1cwGIcjz9PP1Nds6qWXkd0QY1KM/yzt4ZPRk9CmND2RwYGHhvCTDiEo5J505AKut4Ax1qA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7059baca-07d2-461c-5de2-08df43c661d4
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 09:45:43.6732 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gw8UBDQ6RnTq3CUcjO1cs21tl5/3S1O03tKKgAWbrb09119ngA9aAIoDazMImaE0VFUycSVp8ufCFDrqfG9GAhCKBubQtN3P7wtGUuqw/k4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PPFED21B01E3
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Allocation paths take a struct xe_vram_pool instead of a struct
xe_vram_region, so that a region can later be split into several pools
without touching every consumer again.

A pool resolves to a TTM placement through xe_vram_pool_place(), which
only ever narrows the page range of the placement, so that it composes
with a caller supplied range such as the CPU visible window of a small
BAR. A fixed placement has its address dictated by whoever owns that
memory, e.g. the BIOS framebuffer, rather than by the purpose of the BO,
so it resolves the pool covering that address through
xe_vram_region_addr_to_pool() and fails if no pool covers it.

BO creation and BO migration both resolve the pool serving the purpose
of an allocation through the pools the tile publishes, so they cannot
disagree on where an allocation of a given purpose goes. The PF queries
the free VRAM of the pool backing VF LMEM.

Every region still has exactly one pool spanning its whole usable range,
and the kernel pool of a tile is its general-purpose pool, so there is no
functional change.

v2: Handle tiles without a VRAM pool on integrated GPUs (Sashiko)
v3: Place fixed placements in the pool covering their address, not
    in the pool serving their purpose (Sashiko)
    Assert that such a kernel BO does not land outside the kernel pool
    on a PF without LMTT, where VFs could reach it

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |   2 +-
 drivers/gpu/drm/xe/display/xe_initial_plane.c |   2 +-
 drivers/gpu/drm/xe/display/xe_panic.c         |   4 +-
 .../xe/tests/xe_gt_sriov_pf_config_kunit.c    |   8 +-
 drivers/gpu/drm/xe/xe_assert.h                |   3 +-
 drivers/gpu/drm/xe/xe_bo.c                    | 102 ++++++---
 drivers/gpu/drm/xe/xe_bo.h                    |   2 +-
 drivers/gpu/drm/xe/xe_debugfs.c               |   3 +-
 drivers/gpu/drm/xe/xe_device.c                |   2 +-
 drivers/gpu/drm/xe/xe_device_types.h          |   2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |   7 +-
 drivers/gpu/drm/xe/xe_migrate.c               |   2 +-
 drivers/gpu/drm/xe/xe_pagefault.c             |   3 +-
 drivers/gpu/drm/xe/xe_query.c                 |   6 +-
 drivers/gpu/drm/xe/xe_svm.c                   |   2 +-
 drivers/gpu/drm/xe/xe_tile.c                  |  22 +-
 drivers/gpu/drm/xe/xe_tile.h                  |   6 +-
 drivers/gpu/drm/xe/xe_tile_debugfs.c          |   4 +-
 drivers/gpu/drm/xe/xe_tile_types.h            |   8 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |   2 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |  32 ++-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h          |   3 +-
 drivers/gpu/drm/xe/xe_vram.c                  | 210 ++++++++++++++++--
 drivers/gpu/drm/xe/xe_vram.h                  |  14 +-
 24 files changed, 350 insertions(+), 101 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 1bb484254d6e9..91c7501eeb543 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -322,7 +322,7 @@ static struct i915_vma *__xe_pin_fb_vma(struct drm_gem_object *obj, bool is_dpt,
 	if (IS_DGFX(to_xe_device(bo->ttm.base.dev)) &&
 	    pin_params->needs_cpu_lmem_access &&
 	    !(bo->flags & XE_BO_FLAG_NEEDS_CPU_ACCESS)) {
-		struct xe_vram_region *vram = xe_device_get_root_tile(xe)->mem.vram;
+		struct xe_vram_region *vram = xe_device_get_root_tile(xe)->mem.vram->region;
 
 		/*
 		 * If we need to able to access the clear-color value stored in
diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/drm/xe/display/xe_initial_plane.c
index 0f86b73036d03..971d9c78dd089 100644
--- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
+++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
@@ -73,7 +73,7 @@ initial_plane_bo(struct xe_device *xe,
 		 * We don't currently expect this to ever be placed in the
 		 * stolen portion.
 		 */
-		if (phys_base >= xe_vram_region_usable_size(tile0->mem.vram)) {
+		if (phys_base >= xe_vram_region_usable_size(tile0->mem.vram->region)) {
 			drm_err(&xe->drm,
 				"Initial plane programming using invalid range, phys_base=%pa\n",
 				&phys_base);
diff --git a/drivers/gpu/drm/xe/display/xe_panic.c b/drivers/gpu/drm/xe/display/xe_panic.c
index 1a6cee25e9d76..b223ae8fc0209 100644
--- a/drivers/gpu/drm/xe/display/xe_panic.c
+++ b/drivers/gpu/drm/xe/display/xe_panic.c
@@ -52,7 +52,7 @@ static void xe_panic_page_set_pixel(struct drm_scanout_buffer *sb, unsigned int
 	if (new_page != panic->page) {
 		if (xe_bo_is_vram(bo)) {
 			/* Display is always mapped on root tile */
-			struct xe_vram_region *vram =
+			struct xe_vram_pool *vram =
 				xe_device_get_root_tile(xe_bo_device(bo))->mem.vram;
 
 			if (panic->page < 0 || new_page < panic->page) {
@@ -62,7 +62,7 @@ static void xe_panic_page_set_pixel(struct drm_scanout_buffer *sb, unsigned int
 				xe_res_next(&panic->res, PAGE_SIZE * (new_page - panic->page));
 			}
 			iosys_map_set_vaddr_iomem(&panic->vmap,
-						  vram->mapping + panic->res.start);
+						  vram->region->mapping + panic->res.start);
 		} else {
 			xe_panic_kunmap(panic);
 			iosys_map_set_vaddr(&panic->vmap,
diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
index 4d72411cd570c..98891e64565a2 100644
--- a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
@@ -44,8 +44,8 @@ static void pf_set_usable_vram(struct xe_device *xe, u64 usable)
 
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, tile);
 	xe->mem.vram->usable_size = usable;
-	tile->mem.vram->usable_size = usable;
-	KUNIT_ASSERT_EQ(test, usable, xe_vram_region_usable_size(tile->mem.vram));
+	tile->mem.vram->size = usable;
+	KUNIT_ASSERT_EQ(test, usable, xe_vram_pool_usable_size(tile->mem.vram));
 }
 
 static const void *num_vfs_gen_param(struct kunit *test, const void *prev, char *desc)
@@ -87,8 +87,10 @@ static int pf_gt_config_test_init(struct kunit *test)
 	vram = kunit_kzalloc(test, sizeof(*vram), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, vram);
 	vram->usable_size = TEST_VRAM;
+	vram->partitions[0] = (struct xe_vram_pool) { .region = vram, .size = TEST_VRAM };
+	vram->num_partitions = 1;
 	xe->mem.vram = vram;
-	xe->tiles[0].mem.vram = vram;
+	xe->tiles[0].mem.vram = &vram->partitions[0];
 
 	/* pretend we have a valid LMTT */
 	KUNIT_ASSERT_TRUE(test, xe_device_has_lmtt(xe));
diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
index a818eaa05b7dc..1475200751a6b 100644
--- a/drivers/gpu/drm/xe/xe_assert.h
+++ b/drivers/gpu/drm/xe/xe_assert.h
@@ -147,7 +147,8 @@
 	char __buf[10] __maybe_unused;								\
 	xe_assert_msg(tile_to_xe(__tile), condition, "tile: %u VRAM %s\n" msg,			\
 		      __tile->id, ({ string_get_size(						\
-				     xe_vram_region_actual_physical_size(__tile->mem.vram), 1,	\
+				     xe_vram_region_actual_physical_size(__tile->mem.vram ?	\
+					__tile->mem.vram->region : NULL), 1,			\
 				     STRING_UNITS_2, __buf, sizeof(__buf)); __buf; }), ## arg);	\
 })
 
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 42a6aa1a2e4a0..2e08a3c589523 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -225,33 +225,53 @@ static u8 vram_bo_flag_to_tile_id(struct xe_device *xe, u32 vram_bo_flag)
 	return __ffs(vram_bo_flag >> (__ffs(XE_BO_FLAG_VRAM0) - 1)) - 1;
 }
 
-static u32 bo_vram_flags_to_vram_placement(struct xe_device *xe, u32 bo_flags, u32 vram_flag,
-					   enum ttm_bo_type type)
+static enum xe_vram_pool_purpose bo_vram_purpose(u32 bo_flags, enum ttm_bo_type type)
 {
-	u8 tile_id = vram_bo_flag_to_tile_id(xe, vram_flag);
+	return type == ttm_bo_type_kernel && !(bo_flags & XE_BO_FLAG_FORCE_USER_VRAM) ?
+		XE_VRAM_POOL_KERNEL : XE_VRAM_POOL_GENERAL;
+}
 
-	xe_assert(xe, tile_id < xe->info.tile_count);
+/* BO creation and migration both resolve the pool of a purpose through here */
+static struct xe_vram_pool *tile_vram_pool(struct xe_tile *tile,
+					   enum xe_vram_pool_purpose purpose)
+{
+	return purpose == XE_VRAM_POOL_KERNEL ? tile->mem.kernel_vram : tile->mem.vram;
+}
 
-	if (type == ttm_bo_type_kernel && !(bo_flags & XE_BO_FLAG_FORCE_USER_VRAM))
-		return xe->tiles[tile_id].mem.kernel_vram->placement;
-	else
-		return xe->tiles[tile_id].mem.vram->placement;
+static struct xe_vram_pool *bo_vram_pool(struct xe_device *xe, u32 bo_flags,
+					 u32 vram_flag, enum ttm_bo_type type)
+{
+	struct xe_tile *tile = &xe->tiles[vram_bo_flag_to_tile_id(xe, vram_flag)];
+
+	return tile_vram_pool(tile, bo_vram_purpose(bo_flags, type));
 }
 
-static void add_vram(struct xe_device *xe, struct xe_bo *bo,
-		     struct ttm_place *places, u32 bo_flags, u32 mem_type, u32 *c)
+static struct xe_vram_region *ttm_manager_to_vram_region(struct ttm_resource_manager *man)
 {
-	struct ttm_place place = { .mem_type = mem_type };
-	struct ttm_resource_manager *mgr = ttm_manager_type(&xe->ttm, mem_type);
-	struct xe_ttm_vram_mgr *vram_mgr = to_xe_ttm_vram_mgr(mgr);
+	return container_of(to_xe_ttm_vram_mgr(man), struct xe_vram_region, ttm);
+}
 
-	struct xe_vram_region *vram;
+static struct xe_vram_pool *region_vram_pool(struct xe_vram_region *vram,
+					     enum xe_vram_pool_purpose purpose)
+{
+	struct xe_vram_pool *pool = tile_vram_pool(&vram->xe->tiles[vram->id], purpose);
+
+	xe_assert(vram->xe, pool->region == vram);
+
+	return pool;
+}
+
+static void add_vram(struct xe_device *xe, struct xe_bo *bo,
+		     struct ttm_place *places, u32 bo_flags,
+		     struct xe_vram_pool *pool, u32 *c)
+{
+	struct xe_vram_region *vram = pool->region;
+	struct ttm_place place = {};
 	u64 io_size;
 
 	xe_assert(xe, *c < ARRAY_SIZE(bo->placements));
 
-	vram = container_of(vram_mgr, struct xe_vram_region, ttm);
-	xe_assert(xe, vram && vram->usable_size);
+	xe_assert(xe, vram->usable_size);
 	io_size = vram->io_size;
 
 	if (force_contiguous(bo_flags))
@@ -265,20 +285,31 @@ static void add_vram(struct xe_device *xe, struct xe_bo *bo,
 			place.flags |= TTM_PL_FLAG_TOPDOWN;
 		}
 	}
+
+	xe_vram_pool_place(pool, &place);
 	places[*c] = place;
 	*c += 1;
 }
 
+static void xe_bo_set_vram_place(struct xe_device *xe, struct xe_bo *bo,
+				 struct ttm_place *place, u32 mem_type)
+{
+	struct ttm_resource_manager *man = ttm_manager_type(&xe->ttm, mem_type);
+	struct xe_vram_region *vram = ttm_manager_to_vram_region(man);
+	enum xe_vram_pool_purpose purpose = bo_vram_purpose(bo->flags, bo->ttm.type);
+	u32 c = 0;
+
+	add_vram(xe, bo, place, bo->flags, region_vram_pool(vram, purpose), &c);
+}
+
 static void try_add_vram(struct xe_device *xe, struct xe_bo *bo,
 			 u32 bo_flags, enum ttm_bo_type type, u32 *c)
 {
 	u32 vram_flag;
 
-	for_each_set_bo_vram_flag(vram_flag, bo_flags) {
-		u32 pl = bo_vram_flags_to_vram_placement(xe, bo_flags, vram_flag, type);
-
-		add_vram(xe, bo, bo->placements, bo_flags, pl, c);
-	}
+	for_each_set_bo_vram_flag(vram_flag, bo_flags)
+		add_vram(xe, bo, bo->placements, bo_flags,
+			 bo_vram_pool(xe, bo_flags, vram_flag, type), c);
 }
 
 static void try_add_stolen(struct xe_device *xe, struct xe_bo *bo,
@@ -2658,10 +2689,29 @@ static int __xe_bo_fixed_placement(struct xe_device *xe,
 	place->fpfn = start >> PAGE_SHIFT;
 	place->lpfn = end >> PAGE_SHIFT;
 
-	if (flags & XE_BO_FLAG_STOLEN)
+	if (flags & XE_BO_FLAG_STOLEN) {
 		place->mem_type = XE_PL_STOLEN;
-	else
-		place->mem_type = bo_vram_flags_to_vram_placement(xe, flags, vram_flag, type);
+	} else {
+		struct xe_vram_region *vram = bo_vram_pool(xe, flags, vram_flag, type)->region;
+		struct xe_vram_pool *pool;
+
+		/*
+		 * A fixed address is dictated by whoever owns that memory, e.g.
+		 * the BIOS framebuffer, not by the purpose of the BO, so place
+		 * it in the pool covering that address.
+		 */
+		pool = xe_vram_region_addr_to_pool(vram, start);
+		if (!pool)
+			return -EINVAL;
+
+		xe_assert(xe, !IS_SRIOV_PF(xe) || xe_device_has_lmtt(xe) ||
+			  bo_vram_purpose(flags, type) != XE_VRAM_POOL_KERNEL ||
+			  pool->purpose == XE_VRAM_POOL_KERNEL);
+
+		xe_vram_pool_place(pool, place);
+		if (place->lpfn && place->fpfn >= place->lpfn)
+			return -EINVAL;
+	}
 
 	bo->placement = (struct ttm_placement) {
 		.num_placement = 1,
@@ -4039,9 +4089,7 @@ int xe_bo_migrate(struct xe_bo *bo, u32 mem_type, struct ttm_operation_ctx *tctx
 	drm_WARN_ON(&xe->drm, mem_type == XE_PL_STOLEN);
 
 	if (mem_type_is_vram(mem_type)) {
-		u32 c = 0;
-
-		add_vram(xe, bo, &requested, bo->flags, mem_type, &c);
+		xe_bo_set_vram_place(xe, bo, &requested, mem_type);
 	}
 
 	if (!tctx->no_wait_gpu)
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 77b3a02e9b8eb..91804bbfbe0a4 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -31,7 +31,7 @@
 #define XE_BO_FLAG_STOLEN		BIT(4)
 #define XE_BO_FLAG_VRAM(vram)		(XE_BO_FLAG_VRAM0 << ((vram)->id))
 #define XE_BO_FLAG_VRAM_IF_DGFX(tile)	(IS_DGFX(tile_to_xe(tile)) ? \
-					 XE_BO_FLAG_VRAM((tile)->mem.vram) : \
+					 XE_BO_FLAG_VRAM((tile)->mem.vram->region) : \
 					 XE_BO_FLAG_SYSTEM)
 #define XE_BO_FLAG_GGTT			BIT(5)
 #define XE_BO_FLAG_IGNORE_MIN_PAGE_SIZE BIT(6)
diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index e59d4964d811d..d654a5cec6114 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -31,6 +31,7 @@
 #include "xe_sriov_vf.h"
 #include "xe_step.h"
 #include "xe_sysctrl_debugfs.h"
+#include "xe_tile.h"
 #include "xe_tile_debugfs.h"
 #include "xe_ttm_vram_mgr.h"
 #include "xe_vsec.h"
@@ -100,7 +101,7 @@ static ssize_t inject_mempage_offline_trigger(struct file *f,
 {
 	struct xe_device *xe = file_inode(f)->i_private;
 	struct xe_tile *tile = xe_device_get_root_tile(xe);
-	struct xe_vram_region *vr = tile->mem.vram;
+	struct xe_vram_region *vr = xe_tile_to_vr(tile);
 	u64 pfn;
 	int ret;
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 6911c2ac39f82..ab8e5cc923d43 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -691,7 +691,7 @@ static int xe_device_vram_alloc(struct xe_device *xe)
 	if (!IS_DGFX(xe))
 		return 0;
 
-	vram = drmm_kzalloc(&xe->drm, sizeof(*vram), GFP_KERNEL);
+	vram = xe_vram_region_alloc_device(xe);
 	if (!vram)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 8f2a319490737..9f707cad0872d 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -296,7 +296,7 @@ struct xe_device {
 
 	/** @mem: memory info for device */
 	struct {
-		/** @mem.vram: VRAM info for device */
+		/** @mem.vram: device level VRAM region aggregating all tiles */
 		struct xe_vram_region *vram;
 		/** @mem.sys_mgr: system TTM manager */
 		struct ttm_resource_manager sys_mgr;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index cca2f837e90b5..d27e143dba07e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1725,7 +1725,7 @@ static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
 	bo = xe_bo_create_pin_range_novm(xe, tile,
 					 ALIGN(size, PAGE_SIZE), 0, ~0ull,
 					 ttm_bo_type_kernel,
-					 XE_BO_FLAG_VRAM(tile->mem.vram) |
+					 XE_BO_FLAG_VRAM(tile->mem.vram->region) |
 					 (alignment == SZ_2M ? XE_BO_FLAG_NEEDS_2M : 0) |
 					 XE_BO_FLAG_PINNED |
 					 XE_BO_FLAG_PINNED_LATE_RESTORE |
@@ -1936,7 +1936,8 @@ static u64 pf_query_free_lmem(struct xe_gt *gt)
 {
 	struct xe_tile *tile = gt->tile;
 
-	return xe_ttm_vram_get_avail(&tile->mem.vram->ttm.manager);
+	/* Only the general-purpose pool can back VF LMEM, see pf_provision_vf_lmem() */
+	return xe_ttm_vram_get_pool_avail(tile->mem.vram);
 }
 
 static u64 pf_query_max_lmem(struct xe_gt *gt)
@@ -1977,7 +1978,7 @@ static u64 pf_profile_fair_lmem(struct xe_gt *gt, unsigned int num_vfs)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
 	bool admin_only_pf = xe_sriov_pf_admin_only(tile->xe);
-	u64 usable = xe_vram_region_usable_size(tile->mem.vram);
+	u64 usable = xe_vram_pool_usable_size(tile->mem.vram);
 	u64 spare = pf_get_min_spare_lmem(gt);
 	u64 available = usable > spare ? usable - spare : 0;
 	u64 shareable = ALIGN_DOWN(available, SZ_1G);
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 102c96d6cea9a..b4fc5371359d7 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -2774,7 +2774,7 @@ int xe_migrate_debug_ccs_overlap(struct xe_migrate *m,
 	if (!xe_device_has_flat_ccs(xe))
 		return -EINVAL;
 
-	first_page_dpa = xe_vram_region_dpa_base(m->tile->mem.vram);
+	first_page_dpa = xe_vram_region_dpa_base(m->tile->mem.vram->region);
 	clear_L0_ofs = xe_migrate_vram_ofs(xe, first_page_dpa, true);
 
 	scratch_dpa = xe_bo_addr(scratch_bo, 0, XE_PAGE_SIZE);
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index 98cce0f12b123..f7d57627eb0d4 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -19,6 +19,7 @@
 #include "xe_pagefault_types.h"
 #include "xe_pm.h"
 #include "xe_svm.h"
+#include "xe_tile.h"
 #include "xe_trace_bo.h"
 #include "xe_vm.h"
 
@@ -201,7 +202,7 @@ static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma *vma,
 		xe_validation_ctx_init(&ctx, &vm->xe->val, &exec,
 				       (struct xe_val_flags) {});
 		drm_exec_until_all_locked(&exec) {
-			err = xe_pagefault_begin(&exec, vma, tile->mem.vram,
+			err = xe_pagefault_begin(&exec, vma, xe_tile_to_vr(tile),
 						 needs_vram == 1);
 			drm_exec_retry_on_contention(&exec);
 			xe_validation_retry_on_oom(&ctx, &err);
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 9cc35fc83954f..850510443dc77 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -414,12 +414,16 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
 		 * However the uAPI is generic and it's userspace's
 		 * responsibility to check the mem_class, without any
 		 * assumption.
+		 *
+		 * Only the general-purpose VRAM region of a tile is ever
+		 * exposed, and there is exactly one of them per tile, so its
+		 * region id doubles as the tile index here.
 		 */
 		if (!IS_DGFX(xe))
 			gt_list->gt_list[iter].near_mem_regions = 0x1;
 		else
 			gt_list->gt_list[iter].near_mem_regions =
-				BIT(gt_to_tile(gt)->mem.vram->id) << 1;
+				BIT(gt_to_tile(gt)->mem.vram->region->id) << 1;
 		gt_list->gt_list[iter].far_mem_regions = xe->info.mem_region_mask ^
 			gt_list->gt_list[iter].near_mem_regions;
 
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index bc6902b5bf57b..1f6159e97d910 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -2113,7 +2113,7 @@ int xe_pagemap_cache_create(struct xe_tile *tile)
 		if (IS_ERR(cache))
 			return PTR_ERR(cache);
 
-		tile->mem.vram->dpagemap_cache = cache;
+		tile->mem.vram->region->dpagemap_cache = cache;
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 810dfd98d8300..205058e67fdeb 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -119,20 +119,12 @@ int xe_tile_alloc_vram(struct xe_tile *tile)
 	if (!IS_DGFX(xe))
 		return 0;
 
-	vram = xe_vram_region_alloc(xe, tile->id, XE_PL_VRAM0 + tile->id);
+	vram = xe_vram_region_alloc_tile(xe, tile->id);
 	if (!vram)
 		return -ENOMEM;
-	tile->mem.vram = vram;
+	tile->mem.vram = xe_vram_region_default_pool(vram);
 
-	/*
-	 * If the kernel_vram is not already allocated,
-	 * it means that tile has common VRAM region for
-	 * kernel and user space.
-	 */
-	if (!tile->mem.kernel_vram)
-		tile->mem.kernel_vram = tile->mem.vram;
-
-	return 0;
+	return xe_vram_tile_alloc_kernel(tile);
 }
 
 /**
@@ -190,12 +182,14 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
 	if (err)
 		return err;
 
-	if (IS_DGFX(xe) && !ttm_resource_manager_used(&tile->mem.vram->ttm.manager)) {
-		err = xe_ttm_vram_mgr_init(xe, tile->mem.vram);
+	if (IS_DGFX(xe) && !ttm_resource_manager_used(&tile->mem.vram->region->ttm.manager)) {
+		err = xe_ttm_vram_mgr_init(xe, tile->mem.vram->region);
 		if (err)
 			return err;
 
-		xe->info.mem_region_mask |= BIT(tile->mem.vram->id) << 1;
+		/* The uAPI indexes the general-purpose region of a tile by tile id */
+		xe_assert(xe, tile->mem.vram->region->id == tile->id);
+		xe->info.mem_region_mask |= BIT(tile->mem.vram->region->id) << 1;
 	}
 
 	return xe_tile_sysfs_init(tile);
diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
index a2a2c0e936b8e..ed34447c7d4f6 100644
--- a/drivers/gpu/drm/xe/xe_tile.h
+++ b/drivers/gpu/drm/xe/xe_tile.h
@@ -7,6 +7,7 @@
 #define _XE_TILE_H_
 
 #include "xe_tile_types.h"
+#include "xe_vram_types.h"
 
 struct xe_device;
 struct xe_pagemap;
@@ -29,11 +30,12 @@ static inline bool xe_tile_is_root(struct xe_tile *tile)
  * struct xe_tile pointer
  * @tile: Pointer to the struct xe_tile.
  *
- * Return: Pointer to the struct xe_vram_region embedded in *@tile.
+ * Return: Pointer to the struct xe_vram_region backing *@tile's general
+ * purpose VRAM pool, or NULL if *@tile has no VRAM.
  */
 static inline struct xe_vram_region *xe_tile_to_vr(struct xe_tile *tile)
 {
-	return tile->mem.vram;
+	return tile->mem.vram ? tile->mem.vram->region : NULL;
 }
 
 #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
diff --git a/drivers/gpu/drm/xe/xe_tile_debugfs.c b/drivers/gpu/drm/xe/xe_tile_debugfs.c
index 5df2f461b7b7a..b69f4521eed35 100644
--- a/drivers/gpu/drm/xe/xe_tile_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_tile_debugfs.c
@@ -109,8 +109,8 @@ static const struct drm_info_list vf_safe_debugfs_list[] = {
 static void tile_debugfs_create_vram_mm(struct xe_tile *tile)
 {
 	if (tile->mem.vram)
-		ttm_resource_manager_create_debugfs(&tile->mem.vram->ttm.manager, tile->debugfs,
-						    "vram_mm");
+		ttm_resource_manager_create_debugfs(&tile->mem.vram->region->ttm.manager,
+						    tile->debugfs, "vram_mm");
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_tile_types.h b/drivers/gpu/drm/xe/xe_tile_types.h
index 3dc011f111a42..4c5696956fff1 100644
--- a/drivers/gpu/drm/xe/xe_tile_types.h
+++ b/drivers/gpu/drm/xe/xe_tile_types.h
@@ -66,20 +66,20 @@ struct xe_tile {
 	/** @mem: memory management info for tile */
 	struct {
 		/**
-		 * @mem.kernel_vram: kernel-dedicated VRAM info for tile.
+		 * @mem.kernel_vram: kernel-dedicated VRAM pool for tile.
 		 *
 		 * Although VRAM is associated with a specific tile, it can
 		 * still be accessed by all tiles' GTs.
 		 */
-		struct xe_vram_region *kernel_vram;
+		struct xe_vram_pool *kernel_vram;
 
 		/**
-		 * @mem.vram: general purpose VRAM info for tile.
+		 * @mem.vram: general purpose VRAM pool for tile.
 		 *
 		 * Although VRAM is associated with a specific tile, it can
 		 * still be accessed by all tiles' GTs.
 		 */
-		struct xe_vram_region *vram;
+		struct xe_vram_pool *vram;
 
 		/** @mem.ggtt: Global graphics translation table */
 		struct xe_ggtt *ggtt;
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index 60f39efb02d05..38a20307f49d6 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -63,7 +63,7 @@ static u32 get_wopcm_size(struct xe_device *xe)
 
 static u64 detect_lmembar_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 {
-	struct xe_vram_region *tile_vram = xe_device_get_root_tile(xe)->mem.vram;
+	struct xe_vram_region *tile_vram = xe_device_get_root_tile(xe)->mem.vram->region;
 	resource_size_t tile_io_start = xe_vram_region_io_start(tile_vram);
 	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 36d47de8b11ba..226f732ee97be 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -28,6 +28,7 @@
 #include "xe_res_cursor.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_ttm_vram_mgr.h"
+#include "xe_vram.h"
 #include "xe_vram_types.h"
 
 static inline struct gpu_buddy_block *
@@ -508,7 +509,7 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
 			      enum dma_data_direction dir,
 			      struct sg_table **sgt)
 {
-	struct xe_tile *tile = &xe->tiles[res->mem_type - XE_PL_VRAM0];
+	struct xe_vram_region *vram = xe_map_resource_to_region(res);
 	struct xe_ttm_vram_mgr_resource *vres = to_xe_ttm_vram_mgr_resource(res);
 	struct xe_res_cursor cursor;
 	struct scatterlist *sg;
@@ -546,7 +547,7 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
 	 */
 	xe_res_first(res, offset, length, &cursor);
 	for_each_sgtable_sg((*sgt), sg, i) {
-		phys_addr_t phys = cursor.start + xe_vram_region_io_start(tile->mem.vram);
+		phys_addr_t phys = cursor.start + xe_vram_region_io_start(vram);
 		size_t size = min_t(u64, cursor.size, SZ_2G);
 		dma_addr_t addr;
 
@@ -613,13 +614,20 @@ void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
 	mutex_unlock(&mgr->lock);
 }
 
-u64 xe_ttm_vram_get_avail(struct ttm_resource_manager *man)
+/**
+ * xe_ttm_vram_get_pool_avail - Free memory of a VRAM pool
+ * @pool: The VRAM pool, its region's TTM manager must be initialized
+ *
+ * Return: the number of bytes still available for allocation from @pool.
+ */
+u64 xe_ttm_vram_get_pool_avail(struct xe_vram_pool *pool)
 {
-	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
+	struct xe_ttm_vram_mgr *mgr = &pool->region->ttm;
 	u64 avail;
 
+	/* A pool still spans the whole region of its manager */
 	mutex_lock(&mgr->lock);
-	avail =  mgr->mm.avail;
+	avail = mgr->mm.avail;
 	mutex_unlock(&mgr->lock);
 
 	return avail;
@@ -885,11 +893,13 @@ static struct xe_vram_region *xe_ttm_vram_addr_to_region(struct xe_device *xe, u
 	u8 id;
 
 	for_each_tile(tile, xe, id) {
-		struct xe_vram_region *vr = tile->mem.vram;
+		struct xe_vram_region *vr;
 
-		if (!vr)
+		if (!tile->mem.vram)
 			continue;
 
+		vr = tile->mem.vram->region;
+
 		if (addr >= vr->dpa_base && addr < (vr->dpa_base + vr->usable_size))
 			return vr;
 
@@ -984,7 +994,7 @@ EXPORT_SYMBOL(xe_ttm_vram_handle_addr_fault);
 int xe_ttm_vram_inject_fault(struct xe_device *xe)
 {
 	struct xe_tile *tile = xe_device_get_root_tile(xe);
-	struct xe_vram_region *vr = tile->mem.vram;
+	struct xe_vram_region *vr = tile->mem.vram->region;
 	struct xe_ttm_vram_mgr *vram_mgr = &vr->ttm;
 	struct gpu_buddy *mm = &vram_mgr->mm;
 	u64 addr;
@@ -1036,11 +1046,13 @@ static int vram_bad_pages_show(struct seq_file *m, void *unused)
 	seq_printf(m, "max_pages: %u\n", xe_ras_get_max_pages(xe));
 
 	for_each_tile(tile, xe, id) {
-		struct xe_vram_region *vr = tile->mem.vram;
+		struct xe_vram_region *vr;
 
 		man = ttm_manager_type(&xe->ttm, XE_PL_VRAM0 + id);
-		if (!man || !vr)
+		if (!man || !tile->mem.vram)
 			continue;
+
+		vr = tile->mem.vram->region;
 		mgr = to_xe_ttm_vram_mgr(man);
 
 		mutex_lock(&mgr->lock);
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
index d77f067d197b2..6cf8217ec46b5 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
@@ -7,6 +7,7 @@
 #define _XE_TTM_VRAM_MGR_H_
 
 #include "xe_ttm_vram_mgr_types.h"
+#include "xe_vram_types.h"
 
 enum dma_data_direction;
 struct xe_device;
@@ -27,7 +28,7 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
 void xe_ttm_vram_mgr_free_sgt(struct device *dev, enum dma_data_direction dir,
 			      struct sg_table *sgt);
 
-u64 xe_ttm_vram_get_avail(struct ttm_resource_manager *man);
+u64 xe_ttm_vram_get_pool_avail(struct xe_vram_pool *pool);
 u64 xe_ttm_vram_get_cpu_visible_size(struct ttm_resource_manager *man);
 void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
 			  u64 *used, u64 *used_visible);
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 1c02889ba29b2..583906f93bc43 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -28,6 +28,20 @@
 #include "xe_vram.h"
 #include "xe_vram_types.h"
 
+static const char *stringify_vram_binding(enum xe_vram_binding binding)
+{
+	switch (binding) {
+	case XE_VRAM_BINDING_NONE:
+		return "None";
+	case XE_VRAM_BINDING_DEVICE:
+		return "Device";
+	case XE_VRAM_BINDING_TILE:
+		return "Tile";
+	}
+
+	return "Unknown";
+}
+
 static bool resource_is_valid(struct pci_dev *pdev, int bar)
 {
 	if (!pci_resource_flags(pdev, bar))
@@ -200,19 +214,21 @@ static void vram_fini(void *arg)
 
 	xe_assert(xe, !xe->mem.vram->mapping);
 
-	for_each_tile(tile, xe, id) {
-		tile->mem.vram->mapping = NULL;
-		if (tile->mem.kernel_vram)
-			tile->mem.kernel_vram->mapping = NULL;
-	}
+	for_each_tile(tile, xe, id)
+		tile->mem.vram->region->mapping = NULL;
 }
 
-struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement)
+static struct xe_vram_region *vram_region_alloc(struct xe_device *xe,
+						enum xe_vram_binding binding,
+						u8 id, u32 placement)
 {
 	struct xe_vram_region *vram;
 	struct drm_device *drm = &xe->drm;
+	bool tile_bound = binding != XE_VRAM_BINDING_DEVICE;
 
-	xe_assert(xe, id < xe->info.tile_count);
+	xe_assert(xe, binding != XE_VRAM_BINDING_NONE);
+	xe_assert(xe, !tile_bound || id < xe->info.tile_count);
+	xe_assert(xe, !tile_bound || placement >= XE_PL_VRAM0);
 
 	vram = drmm_kzalloc(drm, sizeof(*vram), GFP_KERNEL);
 	if (!vram)
@@ -221,30 +237,104 @@ struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 pla
 	vram->xe = xe;
 	vram->id = id;
 	vram->placement = placement;
+	vram->binding = binding;
 #if defined(CONFIG_DRM_XE_PAGEMAP)
-	vram->migrate = xe->tiles[id].migrate;
+	if (tile_bound)
+		vram->migrate = xe->tiles[id].migrate;
 #endif
+	if (!tile_bound)
+		return vram;
+
+	/*
+	 * partitions[0] always exists, so its address is a stable handle even
+	 * before vram_region_init() sizes it to span the whole region.
+	 */
+	vram->partitions[0] = (struct xe_vram_pool) {
+		.region = vram,
+		.purpose = XE_VRAM_POOL_GENERAL,
+	};
 	return vram;
 }
 
+/**
+ * xe_vram_region_alloc_device - Allocate the device level VRAM region
+ * @xe: the &xe_device
+ *
+ * The device level region only aggregates the sizes and ranges of all tile
+ * VRAM regions, it is not backed by any TTM resource manager.
+ *
+ * Return: the allocated region, or NULL on failure.
+ */
+struct xe_vram_region *xe_vram_region_alloc_device(struct xe_device *xe)
+{
+	return vram_region_alloc(xe, XE_VRAM_BINDING_DEVICE, 0, 0);
+}
+
+/**
+ * xe_vram_region_alloc_tile - Allocate a general-purpose tile VRAM region
+ * @xe: the &xe_device
+ * @id: tile id
+ *
+ * Return: the allocated region, or NULL on failure.
+ */
+struct xe_vram_region *xe_vram_region_alloc_tile(struct xe_device *xe, u8 id)
+{
+	return vram_region_alloc(xe, XE_VRAM_BINDING_TILE, id, XE_PL_VRAM0 + id);
+}
+
+/**
+ * xe_vram_region_default_pool - Get the default pool of a VRAM region
+ * @vram: the VRAM region, which must not be a device aggregate
+ *
+ * Return: the default pool of @vram.
+ */
+struct xe_vram_pool *xe_vram_region_default_pool(struct xe_vram_region *vram)
+{
+	xe_assert(vram->xe, vram->binding != XE_VRAM_BINDING_DEVICE);
+
+	return &vram->partitions[0];
+}
+
+/**
+ * xe_vram_tile_alloc_kernel - Initialize the kernel VRAM pool of a tile
+ * @tile: the &xe_tile, with its general purpose VRAM pool already allocated
+ *
+ * Kernel allocations use the general-purpose pool by default.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int xe_vram_tile_alloc_kernel(struct xe_tile *tile)
+{
+	if (tile->mem.kernel_vram)
+		return 0;
+
+	tile->mem.kernel_vram = tile->mem.vram;
+
+	return 0;
+}
+
 static void print_vram_region_info(struct xe_device *xe, struct xe_vram_region *vram)
 {
 	if (vram->io_size < vram->usable_size)
 		xe_log_info(xe, VRAM, "Small BAR device\n");
 
 	xe_log_info(xe, VRAM,
-		    "[%u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n",
-		    vram->id, &vram->actual_physical_size, &vram->usable_size, &vram->io_size);
-	xe_log_info(xe, VRAM, "[%u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
-		    vram->id, &vram->dpa_base, vram->dpa_base + (u64)vram->actual_physical_size,
-		    &vram->io_start, vram->io_start + (u64)vram->io_size);
+		    "%s[%u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n",
+		    stringify_vram_binding(vram->binding), vram->id, &vram->actual_physical_size,
+		    &vram->usable_size, &vram->io_size);
+	xe_log_info(xe, VRAM, "%s[%u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
+		    stringify_vram_binding(vram->binding), vram->id, &vram->dpa_base,
+		    vram->dpa_base + (u64)vram->actual_physical_size, &vram->io_start,
+		    vram->io_start + (u64)vram->io_size);
 }
 
 static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
 			    struct xe_vram_region *lmem_bar, u64 offset, u64 usable_size,
 			    u64 region_size, resource_size_t remain_io_size)
 {
-	struct xe_tile *tile = vram != xe->mem.vram ? &xe->tiles[vram->id] : NULL;
+	struct xe_tile *tile = vram->binding == XE_VRAM_BINDING_TILE ? &xe->tiles[vram->id] : NULL;
+
+	xe_assert(xe, vram->binding != XE_VRAM_BINDING_NONE);
 
 	/* Check if VRAM region is already initialized */
 	if (vram->mapping)
@@ -274,11 +364,90 @@ static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
 	vram->dpa_base = lmem_bar->dpa_base + offset;
 	vram->usable_size = usable_size;
 
+	/* The device aggregate only reports sizes, nothing is allocated from it */
+	if (vram->binding != XE_VRAM_BINDING_DEVICE) {
+		/* Until split, partitions[0] spans the whole usable range */
+		vram->partitions[0].offset = 0;
+		vram->partitions[0].size = usable_size;
+		vram->num_partitions = 1;
+	}
+
 	print_vram_region_info(xe, vram);
 
 	return 0;
 }
 
+/**
+ * xe_vram_pool_place - Fill in the TTM placement of a pool
+ * @pool: the VRAM pool to place in
+ * @place: the placement to narrow down to @pool
+ *
+ * Resolve @pool to the placement of the region backing it and, when the pool
+ * does not span that region, to the page range it covers. Callers do not have
+ * to care which of the two backs the pool.
+ *
+ * The range is only ever narrowed, so this composes with a caller supplied
+ * one, e.g. the CPU visible range of a small BAR.
+ */
+void xe_vram_pool_place(const struct xe_vram_pool *pool, struct ttm_place *place)
+{
+	u64 fpfn, lpfn;
+
+	place->mem_type = pool->region->placement;
+
+	if (pool->offset == 0 && pool->size == pool->region->usable_size)
+		return;
+
+	xe_assert(pool->region->xe, IS_ALIGNED(pool->offset, PAGE_SIZE));
+	xe_assert(pool->region->xe, IS_ALIGNED(pool->size, PAGE_SIZE));
+
+	fpfn = pool->offset >> PAGE_SHIFT;
+	lpfn = (pool->offset + pool->size) >> PAGE_SHIFT;
+
+	place->fpfn = max_t(u64, place->fpfn, fpfn);
+	place->lpfn = place->lpfn ? min_t(u64, place->lpfn, lpfn) : lpfn;
+}
+
+/**
+ * xe_vram_region_addr_to_pool - Find the pool covering an address of a region
+ * @vram: the VRAM region
+ * @addr: the region relative address
+ *
+ * Unlike the pool serving a given purpose, which the tile publishes, this
+ * resolves a pool by address. It is meant for allocations whose address is
+ * dictated by someone else, e.g. the framebuffer the BIOS left in VRAM.
+ *
+ * Return: the pool covering @addr, or NULL if no pool of @vram covers it.
+ */
+struct xe_vram_pool *xe_vram_region_addr_to_pool(struct xe_vram_region *vram, u64 addr)
+{
+	unsigned int i;
+
+	for (i = 0; i < vram->num_partitions; i++) {
+		struct xe_vram_pool *pool = &vram->partitions[i];
+
+		if (addr >= pool->offset && addr < pool->offset + pool->size)
+			return pool;
+	}
+
+	return NULL;
+}
+
+/**
+ * xe_vram_pool_usable_size - Usable size of a pool
+ * @pool: the VRAM pool
+ *
+ * Unlike xe_vram_region_usable_size(), which reports the whole region a pool
+ * may share with others, this reports only the range reserved for @pool's
+ * own purpose, e.g. what is actually available to hand out to userspace.
+ *
+ * Return: the usable size of @pool.
+ */
+resource_size_t xe_vram_pool_usable_size(const struct xe_vram_pool *pool)
+{
+	return pool->size;
+}
+
 /**
  * xe_map_resource_to_region - Map ttm resource to vram memory region
  * @res: The ttm resource
@@ -330,6 +499,7 @@ int xe_vram_probe(struct xe_device *xe)
 	remain_io_size = lmem_bar.io_size;
 
 	for_each_tile(tile, xe, id) {
+		struct xe_vram_region *tile_region;
 		u64 region_size;
 		u64 usable_size;
 		u64 tile_offset;
@@ -341,7 +511,8 @@ int xe_vram_probe(struct xe_device *xe)
 		total_size += region_size;
 		available_size += usable_size;
 
-		err = vram_region_init(xe, tile->mem.vram, &lmem_bar, tile_offset, usable_size,
+		tile_region = tile->mem.vram->region;
+		err = vram_region_init(xe, tile_region, &lmem_bar, tile_offset, usable_size,
 				       region_size, remain_io_size);
 		if (err)
 			return err;
@@ -352,7 +523,7 @@ int xe_vram_probe(struct xe_device *xe)
 				    total_size, (u64)lmem_bar.io_size);
 		}
 
-		remain_io_size -= min_t(u64, tile->mem.vram->actual_physical_size, remain_io_size);
+		remain_io_size -= min_t(u64, tile_region->actual_physical_size, remain_io_size);
 	}
 
 	err = vram_region_init(xe, xe->mem.vram, &lmem_bar, 0, available_size, total_size,
@@ -441,19 +612,20 @@ int xe_vram_reserve_memtest_bo(struct xe_device *xe)
 		if (!tile->mem.vram)
 			continue;
 
-		if (tile->mem.vram->io_size < tile->mem.vram->usable_size) {
+		if (tile->mem.vram->region->io_size < tile->mem.vram->region->usable_size) {
 			drm_info(&xe->drm,
 				 "Tile %d: Small-BAR system detected, skipping VRAM memtest\n",
 				 id);
 			continue;
 		}
 
-		vram_size = tile->mem.vram->usable_size;
+		vram_size = tile->mem.vram->region->usable_size;
 
 		tile->mem.memtest_bo = xe_bo_create_pin_map_at_novm(xe, tile, SZ_64K,
 								    vram_size - SZ_64K,
 								    ttm_bo_type_kernel,
-								    XE_BO_FLAG_VRAM_IF_DGFX(tile),
+								    XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+								    XE_BO_FLAG_FORCE_USER_VRAM,
 								    0, false);
 		if (IS_ERR(tile->mem.memtest_bo)) {
 			drm_warn(&xe->drm, "Tile %d: Failed to reserve memtest BO\n", id);
diff --git a/drivers/gpu/drm/xe/xe_vram.h b/drivers/gpu/drm/xe/xe_vram.h
index 38425d81f777f..1f15ca456f191 100644
--- a/drivers/gpu/drm/xe/xe_vram.h
+++ b/drivers/gpu/drm/xe/xe_vram.h
@@ -8,14 +8,24 @@
 
 #include <linux/types.h>
 
+#include "xe_vram_types.h"
+
 struct xe_device;
-struct xe_vram_region;
+struct xe_tile;
 struct ttm_resource;
+struct ttm_place;
 
 struct xe_vram_region *xe_map_resource_to_region(struct ttm_resource *res);
 int xe_vram_probe(struct xe_device *xe);
 
-struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement);
+struct xe_vram_region *xe_vram_region_alloc_device(struct xe_device *xe);
+struct xe_vram_region *xe_vram_region_alloc_tile(struct xe_device *xe, u8 id);
+struct xe_vram_pool *xe_vram_region_default_pool(struct xe_vram_region *vram);
+int xe_vram_tile_alloc_kernel(struct xe_tile *tile);
+
+void xe_vram_pool_place(const struct xe_vram_pool *pool, struct ttm_place *place);
+struct xe_vram_pool *xe_vram_region_addr_to_pool(struct xe_vram_region *vram, u64 addr);
+resource_size_t xe_vram_pool_usable_size(const struct xe_vram_pool *pool);
 
 resource_size_t xe_vram_region_io_start(const struct xe_vram_region *vram);
 resource_size_t xe_vram_region_io_size(const struct xe_vram_region *vram);
-- 
2.34.1

