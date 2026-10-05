Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95DB5CA5FFC
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 09:31:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5352A10EC51;
	Mon,  5 Oct 2026 09:31:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kU1A5oNH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52C7610EC51
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 09:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791192676; x=1822728676;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=SXNjFbzlGVq2qwrAPN8qC8MNqe+K15phRchm50VSPEU=;
 b=kU1A5oNH/Xm/nce+KJ6ZcrYfZVp3j1RqT5gFMG0ACBeAQ97OTBB2O8sR
 5zIFQKGfJz7fVePf1MNKUFfajLktiruyJrjmcgJnSyWrW9woqKYcbVtaV
 8NqxaKTSd7/OU9//RIQKxr5AUKLRSmmMT8aWQFYZ994JbwAz+Eghs4Kej
 UCFynUVqm5khzjxgAM5E4unylRjXW7uo/hhETd6ZEXCEwBfbYg1Xz4wWa
 XOQfkYPd2maIsW/2eI+g6uiEpDELkCcsygm54zNhXFlWDl1ozG+BIHmxQ
 Fp68mre9eel8Xzn38eibkdygDgkIlnu7o9SOndo/Ht3BNdgmzeVvZtsuD A==;
X-CSE-ConnectionGUID: X9m3nRc8S/62CoWPz4gSWA==
X-CSE-MsgGUID: Y/p1PfZaSo+QoEXmIaL0+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="101183312"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="101183312"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 02:31:06 -0700
X-CSE-ConnectionGUID: vFqkTBH0TdydkmXw2DtGbw==
X-CSE-MsgGUID: xY3tOMFCT1q7wtpd8uacXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="281544917"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 02:31:06 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 02:31:05 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 5 Oct 2026 02:31:05 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.2) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 02:31:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lEGjbOIr6Ih2Vep7aAhmVtNXikNnQGP6kd7WaLCZGiR9ipsPR7JjQzBNLMtSk/LSMTWBOgf2GkzioI0cAdRTGNmCp9AigQ4gDCruQFRQwWpMOTIaM+/lBcIgEK2gmc/Jg859drsQe7j6NyleYaIR+X2J1O1IR+p+X2+ahSOFLOa9PZj7TO4tv1WdVAp8e939Ge/ivL7rKVH2QCzwLti35gn24jmsyfjSeRW8UbgMNgHEVD2qwgZ0zITo2vgar5rDL6WcNQktUvzeTOnVTiax3DmhKbozzCSV/rmjbuuAKPBhyVdIietRYqclGFwhMsOoNnq1pMhiuC+T/pk8EIryvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9npg5UlhjQo9KU1Znt4fJw4ufooQ05sf1Y/HcUjaAHA=;
 b=ZywJy3cDXDZQppwOWcmdpodi2DN6VB7nPjS5mJwVE/5/Af/Iaats5GZl/k3nuXiBgISIY9t0kqvUfLjcZp1vbRPaz68Jap32bInm/x2ipu5zkNhPkWfLKdFmeJjUkTw8cQdPNzHEUt9fSC/c8i/Y8Vp7xBvXLb5xeuP+9j/Ty7xBU7O2tfiLKRlcO2vesV1voNFil4AlyUhXWnF7Rjbdc+ye8ISpsMTd/WkTpTliIL2+ej1lk4c0M+meScN5u6ev7bfpwT3DhFzQ/Da41sai12S6RQefFnWjCKsneb0vuBTrxTRdSrBytkvSOQAnhycvh6mEYuMa0sM5tY314mc+JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by SA3PR11MB662844.namprd11.prod.outlook.com (2603:10b6:806:538::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 09:31:03 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0451.022; Mon, 5 Oct 2026
 09:31:03 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 6/7] drm/xe/kunit: Test partitioned VRAM manager
Date: Mon, 5 Oct 2026 11:30:20 +0200
Message-ID: <20261005093021.3741599-7-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261005093021.3741599-1-piotr.piorkowski@intel.com>
References: <20261005093021.3741599-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0030.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::16) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|SA3PR11MB662844:EE_
X-MS-Office365-Filtering-Correlation-Id: 70672f6b-3629-4cd1-e501-08df22c35fdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: CObAlkgQcZy8Jp/kboi8fYyy3CpXvgVaeVwpiXjmnFh9e04AVk8uanTrkB4BkJWM802WhWQ8cYyShTV+u193YAyWbIYFwCDR3PIVHUjvQhM22T2/gYwIpOj0NlQWsxrK5ppa+9aoju/ppGcuL3JlnnHAgxYCMlQsq8zDVjyH7WpkroiC5Vr1rvMWDw/EyEq6rtx76Zm39xANsiUZmdEFYCrduHKeu+3advRKjlv6TaNQizRzWGzRplkQukwXjlDptZgFnXNgboLCFbH0E/D/P1x7f20IW06WM+i07ZQi2tdHrFhlwJINoJlrgyMpxopav89Zu5RyrQMyVS3xG3pJQpBjQfyjssYhG9Ab5aL1uq1KIgcRmmayzjyxT3ACcb7wnu6BO5tuwZADviInlB6ntMVuH+or7k1rNUS2N2zdvVPbOdCB5G6iyuSfkxsSUH7kd4in8iP3mp5V2+5jCoLuTVTW7F6OqpTFRC7n4SLKQwKW7svT9rLntf7fmqQPKjc2p6GrRX/VKDLLtvLAcqsj64xcwJ6ItAMBcbk8DmxJo2oGrqebT6RUgd8w8CtjeScPsKUwzhv5XOyjooEK6RQR4nGkeIMKykIyCe16Xv8lO64B4QP32eIpMyzZ2LL/vsZ/oRrreum9dUUlDutueuIWR0MmMyWYdQaDzZjAnkbL7U0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFVSUmxWOGJYaVc4NExaZWZJNmVvaXg0czRXOWxIZi85QndGZU9SUGx5M2gv?=
 =?utf-8?B?VzNKZ3lNRkF5UHJjdnNoQjlodU1QL3h5RXR2dlpKclptRUdNQ0hvRzZkVzN4?=
 =?utf-8?B?bkg5ZHQ4TEliOU1FQzM1R2lRUm9uZDdDbDN0ZnRNazNhdFpUQ3JGYVpNTDYx?=
 =?utf-8?B?eE5JcTUwSG90K3FNV29rdlp6VStFVzVmRkZJN0FXdDQyTVpKN0REd2YwK21S?=
 =?utf-8?B?aEFIOXJQQ1d3N1U3VXZwalpoUXRjR1RJZklSTkNDWHdyaDVmQzBtNkNjdmFM?=
 =?utf-8?B?SWNBa1crNlBZY1VCT3ZsVUhsVitObUliQ09OUVVodktlTm5qek5qWUN5VXNa?=
 =?utf-8?B?SDUvY1hIYUtnZ0doS2lsQkRJeko5WWhsM2N5SkZlVE5tNW9DOXNUS1lPbnR4?=
 =?utf-8?B?bWQxVUR4bVJUOTFiTFZXVUJYRThWbjJPTGRxWkdtVk5IUzR3UDkyekpQREN1?=
 =?utf-8?B?Y1YxTThpSlVLa0xJbGtRRHo2NWlyZ3AvZE9VcXVSTXk4V1hWMDJFaGF3Vmly?=
 =?utf-8?B?VGw1NnJBUXF4ZWI0MTR1eHFUYk9pV2RIdHZuOXNQaEZRWDJSTzNtTmlXMG9n?=
 =?utf-8?B?dlFQdXlDaFROZWZPZmZaWGFUbFE2UGVTcnA2dG9kNXJWSzJjRVlya0szbEll?=
 =?utf-8?B?eVBjem9KN0F6eUp2c0VxV1JFSEw1K2MyZUpsVWVOaTVyeFljNitsNTdrVGcz?=
 =?utf-8?B?d3Y2Wm5PN3I0cW53Yk1Tc2lHNXpCL2plb3FSc2ZnN1cvTnNhR09PaG1qSzhv?=
 =?utf-8?B?eTU4RlIxTGtqWmQ1ekUxUVVNYWlkOEZQNytUWUxWZUFMbXpKWGZXSCthRmoy?=
 =?utf-8?B?L00rcEFZRVpMZ25ycTFVS1VrUktpYkpBRzdrNmNTSXJZUTFpdFF6REhxd0hK?=
 =?utf-8?B?V3c5d0lJaW1IUnFDS3JiOFNoaEpOMTZORXNnUy9JUkJmNWd1cDFHMWVIdUhH?=
 =?utf-8?B?d2UwNnFjMnhyTndRa05kcG80RlhQb0VwcFlLU1lJbE1TUmNJd3ZsOUIzekFS?=
 =?utf-8?B?OERROUppM2Z0UTl1UkxMdGNSdnk3K1E2UWM3R2JLUUdHckc1SlJ1RGoxYkd2?=
 =?utf-8?B?eFl1TjVWNFloditZL1JZRERWRmxZMXYxZlB2RzBrNmd5YThQTFRrWFMzTUd6?=
 =?utf-8?B?TXhlS2xPNWg0UmhqcFJLYmoxdEx4dW82OTY3SjY3RWJoUmdQeWg0U3hZSzNR?=
 =?utf-8?B?TWk1bFRWNHZKQThIZEhpazM1SEN5cXU1bTFBYTB6a0pRTUVIaXc3OHdYc1Vp?=
 =?utf-8?B?VzljMUxOTnFCeGhFVXZ0aTBNWHFVdzFkcUwzUkpHQmN3N1VsZlFDNzhQRXIz?=
 =?utf-8?B?VVpsTENrbmtLTGhBajV2VXFrNG1KeHV4M2o3bW5NUDNVUk9NQWJZQ2hCNmxz?=
 =?utf-8?B?Yk9oYmNGa1QwSGFwYUlGRDlsTnJYM1E2OC9iK2NNNHk0L2lDOUlOaS9iK0Nw?=
 =?utf-8?B?RWlUN0NuMGRVc0V5aGJOK25zcTFVa0ZmZGN2a1h2U0JyNFBRYUl4Uk95Qytz?=
 =?utf-8?B?SDVFS24rWkl1YnNTZFN4VVZpdUJPT0crR3RJQkJHZ1hnQmliT3ViaVhXUzcy?=
 =?utf-8?B?aGxFcFhaQ0RGZGZESk1YdFBKaUxQNkRjYnhFN2ZJNEN1OG1SZVlNdjdLeUlj?=
 =?utf-8?B?bWdNVkd2MWZ5QVNhaEtKa21uT3EyNERQOUtSM2x1eHEyNFpwcUJDOVptY0Jl?=
 =?utf-8?B?OVFQeFNTeXJ6dDdWdFE3U0hjcHNMWnNsT0RQVkN5c3FTWG1nVjNVdWJLeWhY?=
 =?utf-8?B?b3BxQ05oUUQ4U3dpQXVUeDdTd2gwZUJjUFZjam1nZ055aTkxdWlHeEtKalBx?=
 =?utf-8?B?VSs0ZTYyNmdVVXdkeWRSRVVESk9aV2ZhQmV5RHZKU3ZoTUd6T2hBMERtRE01?=
 =?utf-8?B?RlpWdUk5bHpuZnVEWGlkOGxPRWNSbGhKSFRmMDZZZlpEZVkxSUZGby9nbWlL?=
 =?utf-8?B?ckh2TTA2WFdCdXpKM1JEN1hXUVQwbWk4Q1dsL2V3S1FQaXRXcUVpRmV2K2hB?=
 =?utf-8?B?bTVzRzNOa3RWMjl4SFF6dUNDT2o5T3BGWkdVQW4rVWx1d1JTWVlKNFNhT0dH?=
 =?utf-8?B?TWlMN3QxNzdNRGhJKy9aUTVNeHVUNWQrTkthbXcreVdIN2VIbUdwSDcvd3d6?=
 =?utf-8?B?QjlFZ3BVdTVPSGRkOTJwSnZ4ZFR6b05NVmhqeVE1Sm9VeEpOL3VreHVqdCtW?=
 =?utf-8?B?aGM5Y3MrWFd3RlRyUW1haFBna3NxTXBiTEErdnNSVXFKSVlsSFJwMHV1RkxD?=
 =?utf-8?B?eWZOWEtPRSsyeGtqSEFNQ1BDSWdndHR5N2pTbDRsbGFkS3Nsdnd2ejR1WGts?=
 =?utf-8?B?TGt3elZ0UkJ3UmVNQnNZVHQxZVJHdzJiUWtxRldJRFBoKzh3bmlGUUFRTmI3?=
 =?utf-8?Q?J0tQjY5OMkt0kRAo=3D?=
X-Exchange-RoutingPolicyChecked: BLFelQ+ogZ8JwRLuUE8gb0vgLMc5xvpODhJv7JT2KB8+Wb4d78wuuHYxpuYCexuNP/f2m8s+0UirX+7nKXemk4YKn7ynTjAWXY8WaTceliH64zMOr5YRqFIv9fvM6OsLAg2Us6G/CBhHN6dycaRC90wvj18uTk627v8X74MLWuwW09hvYXY6FG38oZOHBNixtXlNLZ5SFFRNWLt2ekB7GM1AXvoM/Dn20jYI7kpdhpw4xQ/dgXSfpKG9NnsKbDFMqC3vzxB5hnLGNuh+ugS/ew7q+czV71ew4U/+T7iBZdjBuGDtSV1lHeV6dQxT4YDHnxADCGvXYio6iq+n2tybEQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 70672f6b-3629-4cd1-e501-08df22c35fdf
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 09:31:03.5141 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eiOzHWoyuL8Oz4ICaJXfkb2q4K6IiILqdYLloJfMTXpXVITJaFlBlBjXP84R5O/v7bWmxaPsCAj+KYAklPXdJH83uZERSX/zWJ4pI9iSiRo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB662844
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

Exercise partition selection and address lookup, plus pool usage and
CPU-visible memory accounting across partitions.

Assisted-by: Claude Opus 5.5
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_ttm_vram_mgr.c | 147 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       |   4 +
 2 files changed, 151 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_ttm_vram_mgr.c

diff --git a/drivers/gpu/drm/xe/tests/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/tests/xe_ttm_vram_mgr.c
new file mode 100644
index 0000000000000..1ad3186e6d5be
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_ttm_vram_mgr.c
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <kunit/test.h>
+
+#include "xe_vram_types.h"
+
+/* The layout xe_ttm_vram_mgr_init() derives from the pools of a region */
+static struct xe_ttm_vram_mgr *split_mgr(struct kunit *test, u64 kernel_size, u64 size)
+{
+	struct xe_ttm_vram_mgr *mgr;
+	struct xe_vram_pool *pools;
+
+	mgr = kunit_kzalloc(test, sizeof(*mgr), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, mgr);
+	pools = kunit_kcalloc(test, 2, sizeof(*pools), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, pools);
+
+	pools[0].offset = 0;
+	pools[0].size = kernel_size;
+	pools[0].purpose = XE_VRAM_POOL_KERNEL;
+	pools[1].offset = kernel_size;
+	pools[1].size = size - kernel_size;
+	pools[1].purpose = XE_VRAM_POOL_GENERAL;
+	mgr->parts[0].pool = &pools[0];
+	mgr->parts[1].pool = &pools[1];
+	mgr->num_parts = 2;
+
+	return mgr;
+}
+
+static void select_part(struct kunit *test)
+{
+	struct xe_ttm_vram_mgr *mgr = split_mgr(test, SZ_128M, SZ_1G);
+	struct xe_ttm_vram_mgr_part *part;
+	bool exact = false;
+
+	/* The ranges a pool resolves to cover a whole partition */
+	part = xe_ttm_vram_mgr_select_part(mgr, 0, SZ_128M, &exact);
+	KUNIT_EXPECT_PTR_EQ(test, part, &mgr->parts[0]);
+	KUNIT_EXPECT_TRUE(test, exact);
+
+	part = xe_ttm_vram_mgr_select_part(mgr, SZ_128M, SZ_1G, &exact);
+	KUNIT_EXPECT_PTR_EQ(test, part, &mgr->parts[1]);
+	KUNIT_EXPECT_TRUE(test, exact);
+
+	/* A narrower range still resolves, but needs a range allocation */
+	part = xe_ttm_vram_mgr_select_part(mgr, SZ_256M, SZ_512M, &exact);
+	KUNIT_EXPECT_PTR_EQ(test, part, &mgr->parts[1]);
+	KUNIT_EXPECT_FALSE(test, exact);
+
+	/* Partitions are a hard split */
+	part = xe_ttm_vram_mgr_select_part(mgr, 0, SZ_256M, &exact);
+	KUNIT_EXPECT_NULL(test, part);
+	part = xe_ttm_vram_mgr_select_part(mgr, 0, SZ_2G, &exact);
+	KUNIT_EXPECT_NULL(test, part);
+}
+
+static void addr_to_part(struct kunit *test)
+{
+	struct xe_ttm_vram_mgr *mgr = split_mgr(test, SZ_128M, SZ_1G);
+
+	KUNIT_EXPECT_PTR_EQ(test, xe_ttm_vram_mgr_addr_to_part(mgr, 0), &mgr->parts[0]);
+	KUNIT_EXPECT_PTR_EQ(test, xe_ttm_vram_mgr_addr_to_part(mgr, SZ_128M - PAGE_SIZE),
+			    &mgr->parts[0]);
+	KUNIT_EXPECT_PTR_EQ(test, xe_ttm_vram_mgr_addr_to_part(mgr, SZ_128M), &mgr->parts[1]);
+	KUNIT_EXPECT_PTR_EQ(test, xe_ttm_vram_mgr_addr_to_part(mgr, SZ_1G - PAGE_SIZE),
+			    &mgr->parts[1]);
+	KUNIT_EXPECT_NULL(test, xe_ttm_vram_mgr_addr_to_part(mgr, SZ_1G));
+}
+
+static void general_pool_usage(struct kunit *test)
+{
+	struct xe_ttm_vram_mgr *mgr = split_mgr(test, SZ_128M, SZ_1G);
+	LIST_HEAD(kernel_blocks);
+	LIST_HEAD(general_blocks);
+	u64 kernel_visible = 0;
+	u64 general_visible = 0;
+	u64 used, used_visible;
+	unsigned int i;
+	int err;
+
+	mutex_init(&mgr->lock);
+	/* Only the bottom 256M are CPU visible */
+	mgr->visible_size = SZ_256M;
+	mgr->visible_avail = SZ_256M;
+	for (i = 0; i < mgr->num_parts; ++i) {
+		KUNIT_ASSERT_EQ(test, gpu_buddy_init(&mgr->parts[i].mm,
+						     mgr->parts[i].pool->size,
+						     PAGE_SIZE), 0);
+		gpu_buddy_driver_set_lock(&mgr->parts[i].mm, &mgr->lock);
+	}
+
+	mutex_lock(&mgr->lock);
+	err = xe_ttm_vram_buddy_alloc(mgr, &mgr->parts[0], 0, SZ_128M, SZ_8M,
+				      PAGE_SIZE, &kernel_blocks,
+				      GPU_BUDDY_RANGE_ALLOCATION, NULL,
+				      &kernel_visible);
+	KUNIT_EXPECT_EQ(test, err, 0);
+	/* Straddles the end of the CPU visible window */
+	err = xe_ttm_vram_buddy_alloc(mgr, &mgr->parts[1], SZ_256M - SZ_4M,
+				      SZ_256M + SZ_4M, SZ_8M, PAGE_SIZE,
+				      &general_blocks,
+				      GPU_BUDDY_RANGE_ALLOCATION, NULL,
+				      &general_visible);
+	KUNIT_EXPECT_EQ(test, err, 0);
+	mutex_unlock(&mgr->lock);
+
+	KUNIT_EXPECT_EQ(test, kernel_visible, (u64)SZ_8M);
+	KUNIT_EXPECT_EQ(test, general_visible, (u64)SZ_4M);
+	KUNIT_EXPECT_EQ(test, mgr->visible_avail, (u64)(SZ_256M - SZ_8M - SZ_4M));
+
+	/* Memory taken from the kernel-only pool is not reported */
+	xe_ttm_vram_get_general_pool_used(&mgr->manager, &used, &used_visible);
+	KUNIT_EXPECT_EQ(test, used, (u64)SZ_8M);
+	KUNIT_EXPECT_EQ(test, used_visible, (u64)SZ_4M);
+
+	mutex_lock(&mgr->lock);
+	xe_ttm_vram_buddy_free(mgr, &mgr->parts[0], &kernel_blocks, kernel_visible);
+	xe_ttm_vram_buddy_free(mgr, &mgr->parts[1], &general_blocks, general_visible);
+	mutex_unlock(&mgr->lock);
+
+	xe_ttm_vram_get_general_pool_used(&mgr->manager, &used, &used_visible);
+	KUNIT_EXPECT_EQ(test, used, 0ull);
+	KUNIT_EXPECT_EQ(test, used_visible, 0ull);
+	KUNIT_EXPECT_EQ(test, mgr->visible_avail, (u64)SZ_256M);
+
+	for (i = 0; i < mgr->num_parts; ++i)
+		gpu_buddy_fini(&mgr->parts[i].mm);
+	mutex_destroy(&mgr->lock);
+}
+
+static struct kunit_case xe_ttm_vram_mgr_tests[] = {
+	KUNIT_CASE(select_part),
+	KUNIT_CASE(addr_to_part),
+	KUNIT_CASE(general_pool_usage),
+	{}
+};
+
+static struct kunit_suite xe_ttm_vram_mgr_test_suite = {
+	.name = "xe_ttm_vram_mgr",
+	.test_cases = xe_ttm_vram_mgr_tests,
+};
+
+kunit_test_suite(xe_ttm_vram_mgr_test_suite);
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index d4665851f727b..4cc720c9f9caa 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -1285,3 +1285,7 @@ void xe_ttm_vram_debugfs_init(struct xe_device *xe, struct dentry *root)
 		return;
 	debugfs_create_file("vram_bad_pages", 0444, root, xe, &vram_bad_pages_fops);
 }
+
+#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_ttm_vram_mgr.c"
+#endif
-- 
2.34.1

