Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E0FC61DC2
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 10:29:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4388C10E648;
	Thu, 27 Aug 2026 10:29:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DpXShTXI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECF8D10E648
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 10:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787826568; x=1819362568;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=aPNylGTjU9AXnu3UrY9Dqi9ujEnv+KKswiN2y3l0jvI=;
 b=DpXShTXIkSbxSKufnuQJypD2U2lhDp1kRpuoXLz00RmtkwX3VQ95VYv2
 qAN10sCUP99LFDRGBv6zZmsaB6AV8jv6T29AwMD3eEIFM4yp97VUlBrD7
 TnXWrkRcsazQbam5txpHpVIOeAWs/2NopmdMLmgb/8wTEQg0gZgQdTv67
 MgYdIeErONN9ECefD+GgTqZhDKr9ja3Ql1eOZZQaD+q3cf2s2Q63KRrkg
 hdxXeeL1fgLlTjA6cFgbJBWk7jG3ne4shwNAAVI9DoSGZBmAZ4ZW1lcXm
 XLyjXFd+/ESb5/udhTfmYrJgbI4+AKtPlPQVfANBJArmLsjHNow8+0U8I A==;
X-CSE-ConnectionGUID: JMPv/khHQUKlH9pvo8GemQ==
X-CSE-MsgGUID: QqaWAXMrSIaoRnvQHYR+jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="98920679"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="98920679"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 03:29:27 -0700
X-CSE-ConnectionGUID: neJF0HICSyee6Ru16rYsbg==
X-CSE-MsgGUID: JmqTj05WSGG3yk20EiBh/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="265235652"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 03:29:27 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 03:29:27 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 03:29:27 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.51) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 03:29:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dAOX1teKStA8nWNnYeQYtoAfGXxignNc4AZIVW8ExlDp6XdS/TSL1BCF9zsVBqaaso12QMwxPDTVilZMwdgoqXXT/6iYEtsISTfob5JpvbHkZK5E/0zBZFOwI1GA4UNY9T+F1DavLzU1WXC9ygRZstVTWfWR7JPWGptV7tZrM3dtn5hy8gWV5FOgiqjQlGobEwWOP+OdT0lquyLkPbGPOE5emV/Wdk7YJms9tv+enkSmt+n2+oxtdwnFOT6OgpUeyTUzafjBcKNmMJtZpv79J53GYHQfPrquVD7z30080jMt9DW0t7QQ4WTxCoFPmLvXtYhFZOKD/nDtowOVXb084Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r9/h1tqTG9D07yT7CVsP72uCybG+YXPuf7Z0Zu9w+h4=;
 b=D59o8jt7cBdDWaTL1iOMqpKLHJYB3+XRfnseu47NlKDandTmIz2PpsRu3iq+/V6GX7WzCfy29L+nX+qKfaL/juCpnYg87+vW8FMSqD24oAYr5D13rFoOvzbSnb+yhDUFqQSBqgodTppdOwLml4BeEtnC8nKDc9YGL7nxAfCjXVfUCKYTdXLJP+719nRXzqEEAgY1bD+aZTNkAUW1riGFvWcWRrRKaCjmYpsgJjMeDz4pCayMuh4BI84AwIq3eD23+ZUd9qZDk8rvizSvlZwhRSK4Unstd9kuLwCHdfV4veOSpV0R9ao6aTWEJ7WNilU7YV7gFczd2gHtWxCFoNUG7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by MN2PR11MB4536.namprd11.prod.outlook.com (2603:10b6:208:26a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Thu, 27 Aug
 2026 10:29:25 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0360.006; Thu, 27 Aug 2026
 10:29:25 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: [PATCH v3 4/4] drm/xe/pf: Explicitly use shareable GuC IDs for VFs
 provisioning
Date: Thu, 27 Aug 2026 12:29:02 +0200
Message-ID: <20260827102902.1236918-5-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260827102902.1236918-1-piotr.piorkowski@intel.com>
References: <20260827102902.1236918-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU6P191CA0043.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53f::29) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|MN2PR11MB4536:EE_
X-MS-Office365-Filtering-Correlation-Id: a4166388-70c4-4a96-3489-08df04261111
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|18002099003|22082099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: FwCtY6tKhH+5qGVjYk5HIMmo7+eHqspA7sakGfuLV8fQxOaeWZzMs5dEI3FP6bboV6vp+EXdWtZvZbUyUvm6thREAk0rHll5cUl9nrva63O0T7Xl8oCQEeD7jtMEX5vO77HYqsHQDwhbL9ptGAz8TKL1n+i8oKXwrWZeeREQlw5UTWT0tr2ljpDelm5+lskRekDgQxyDJhnGsmG0g/kc8+JwYk9gERAfmeMYkJ28ulks4xGWLcRx1eRZxD51p7RbBCdTF1MdKkkGwEbCrUDfjYQPiqNSFhWbMK9b7EnWqETSTDSVbSUX6qzKS2OE/MmbXOzfiN7FloHhWBdkHdhpbUD8IX0FAnQKv3Yk151sqlr1GkYS4sc/+zWueAOTj2ofDQ2Xkycjk/+a3CUFVyB6zaTBC+HCQvbp0+HUUEj1fYVuoTlagwCQCdWCj14w6PDeTqtGEVcW4TGOncJiP3m8kyNAQYF6mvJs18aD1H79n3zxU7+lMLt4/kjKD9QJOO9ZMJB4r0Ffi8w2gSf7j1AJGZPKA8SLC7Sk/g39HxZtXFyW9HVZilZ0JIas2oYTwSsuXZlug33OUWuZD0Y0NTj6Um4yI8Che0RQYKNFlPttn/wnfW3HyG0X/SM4WTe9od+V+pj0mmCXh3/QMM0YKQAYldschG32yKfnPVcAeeVUr8Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(56012099006)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUlEdk84MVBqa2lieVB6M3RqNkx5dTdkb2lpU2lsaHpFZGpMMVhEbEMzWTIv?=
 =?utf-8?B?dGVCT1AwKzU3Zm1tSXF4LzlyckViejg5WlBCNFllb081QjBHemtldDh5c0Iw?=
 =?utf-8?B?bUtCOEdjQjVBVGZROUlJUlU5bnJmMEZwaXlXdUZ4Zmd5NXI0ekQrYVptM2hJ?=
 =?utf-8?B?QjBaWkhmckJVcUhnWUhNYzBuWnV4UU5nTkltaGxzd0JsSFM0bUhJQW5veGtj?=
 =?utf-8?B?ZVVDNDF6VEhqRlpBRWQ1SlNNNTRWbTdScU1Za1RMVUhvOE1qVHV6dmx6MjBj?=
 =?utf-8?B?NGV1UnJ4dXJpNEpjSjNUVS9GY3l3UW54enhyRWhNRkNNOWg0cXc2MFpBejdm?=
 =?utf-8?B?bzNoZUNqQVBuay8xZG5zWVlpUm5MTndPNndWQmpZM0FrUmMzWkdVbUVOekFP?=
 =?utf-8?B?bnM1ak1qRFU0SnJxY3hsODNUdCs4T0R3VTZHQmJpbVdPSXFnUFJCbkpOakpL?=
 =?utf-8?B?b3dCVU90YmpzSEVyV3YvK2FwWmo4Z216Sk9vQ1dJcjBERy85aUlaaTdFZW1N?=
 =?utf-8?B?UVdUVGlCTjZWcTNSY1JzK01nTHZoWWpHYkNZK2Y0RFEvYmphSEtTNnNwWjVn?=
 =?utf-8?B?VUU2RzVzTy9sTUNWU21DdnNoTWlTT1hBY0YvaTlvOTRLZ1ByMjl3bzhqRjQy?=
 =?utf-8?B?YTVlWDJSUnFvSUFocWYyeHBhL1o1T0J0NlJtbndoT3JIWG45Q09HZktjcmNs?=
 =?utf-8?B?YXRJVmtsdXNZblNoZFNpUlZRVkFVR3poWUMrclZsMDAzNjk1VFpaMUxjTXE2?=
 =?utf-8?B?UVVUVTUwNHF2MysvaHNoYVR1UjV4ZUE0NUZNcU5EUTQ5T1NBNk1NY29RT3JN?=
 =?utf-8?B?U0d0WUVjZ05jaS9aVWIxME44QjcwSndKeG83NlhPS0FNNVB3UHlWNkdwVlp2?=
 =?utf-8?B?RHI4b3VKb0Ixc25pUVNkaGg0UENmRnlCRVNMeVFPV0tpRFFKbk1XNGNUOFYz?=
 =?utf-8?B?SmtGYXN0bHk1YVMvLzRhaVpyaXY4U24ySUZmU1hEVCtOUkd5NXduSGdFR0dF?=
 =?utf-8?B?RGJxK0RIcUJMYWlWdkdYUzBodFJlNWpPWng3T3B3bm84cXBJTjhHRGpzOU0v?=
 =?utf-8?B?YndGcWQrU3krRkRNdDR2cEpFNCtLQVZDdnVKYjgwYmpGV1FRRERzWmdQVlIw?=
 =?utf-8?B?L3VuQ0VBaWQ0MnlERE53RVBvRVE3eStrOEovU2VwMzJtWXVxUnlPUlljZkpD?=
 =?utf-8?B?RlRHK2J0RWI2Zml4dllyQUhKV21RYjBiZGd0YjBJek5kNUhZbVdwcXNxdmJi?=
 =?utf-8?B?b0RHU3c5VnJlNm9ud3dOZXQ4R3NqS0ZtTnAxdG9hNGFqdUNRN3dQa0dlMmtr?=
 =?utf-8?B?MTVDUmdKc2NOTFpFT3gvN2U3Nkw4SDJta1VMbDZDN2RsQ1NpakgwWnRndzJj?=
 =?utf-8?B?K1E3elBKRUhOK1p3NTNYT2FiZmtlOEUxcmtDbm5BRU94NlJzU3NiL2NkdWZL?=
 =?utf-8?B?QzFjMVJBdjRiSXhLZFhTcFB4NlFYbFJ3Y2xqVWpzVDJzR2hPbXIrb0hsZkNT?=
 =?utf-8?B?MCtISnd1aXZEOFN0a2M1M3ZnekZjaTZiTElnNmxlK01hdlE5THl3VU1STnlO?=
 =?utf-8?B?T2tEMmsvMHdKZkdSNHpMRUJIYUVRMWRpVmVMYXp4WFdkejdIRkh6T0x6eklK?=
 =?utf-8?B?L0RMWU1HdWNHbmpqcDFQYlRDYS81dCtSODBxd29RQWxhdUxIZFByMGNGck90?=
 =?utf-8?B?c1UzdHh6cmd6ZVYxNlNjc2x0eGJEQmlsTGJQRy9FNVVNUnhnOEZ3a1M5bzdM?=
 =?utf-8?B?KzR2Z1dGeUZTL1E4UjVQVkw5YVNFSCsxTmlIWVo4S1hYM1FRemR5cU1Gckcv?=
 =?utf-8?B?ZTdBeEdhS0plU3hNTXJmRXB3VE1nUDlTdEE4UVhlU3NFNlF5anhHRU9RYUNy?=
 =?utf-8?B?N1dsT1p0UlhWOFAzd3lRTEJtV1NpT2g5TUxDM3FjZU9RRFpKSWxrRVlUcW1z?=
 =?utf-8?B?OU9aRWh0SnFackpYREhRRzFaMUs5dmhSYVJWekEyU0VETVZhMi91MHZORHBU?=
 =?utf-8?B?Nk9laWF2Yzc5U083ZGQ0akp5dkhBT21ncnRaT0ZyS3Bla2xOMklWcFNQc3pL?=
 =?utf-8?B?LzhXVDFmSlpBTHlUTG52SUE1bTI3SWNLVHBWM1JTV2lTMGVRV21UcVh0TXRV?=
 =?utf-8?B?ZzRQeG1DVVUrL0dPSUFoa1JvVmc1TUgyY0w3aS9YMjRuSnlWRVhYMkpsQmVp?=
 =?utf-8?B?L0ljdUVJeGZMTDlHS1JXc0dIYnQyRnRLUnZIS0UvVWJxWlB2Unc3VHB1dCs3?=
 =?utf-8?B?VE84V2Q2c0oySUp4SW5iMDJ3cDR0eEc2cnlrL2t4UEJkWEZwVXlic2dLMEVJ?=
 =?utf-8?B?dER3QVI5WHZqQzNrb2RKS0ZSemZIT1hhdEZ3OFBpQjlJeEFFQ0VYNVlCeG9O?=
 =?utf-8?Q?tDv++azFcWvrxoVQ=3D?=
X-Exchange-RoutingPolicyChecked: gnG+Os6KIVz6KzIfuxK+fP5+Mj8xxGjV5ejvNuErSGkT6aDAbRrgyOqVRrV9wp+N6SEIgeLCwqHkhrnOAHR1jF7z7sJXN3KQ5fmSGV/NipV0WUZOsYydg0YtkGO+0fR2ak4HPYKCPbRNp4GZfLA489gjRka1ctV3/0IYd0qX9RUAFn+bgtHh3kXXUCdXq1AWbfaohDFuH5xaf3dp0keBN7mbPN7I81YZ6d8txh9oq5SUeqqjeNMePsLmhS+AZA6oDu/d/1x3Enm/dte/0/6iKkGeEy0eocvxmXtdOFfbPXZq+Uy+wpB8+Y0IHoV9SLhR8tdIzmmKZ30oCkam78LX7Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: a4166388-70c4-4a96-3489-08df04261111
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 10:29:25.2717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nVKkNpfpKO2n4U6HaYro0z1FAxl/Totn4ixiDGzWu+s6IixJ5kUiSbdZuwRy8Rt0JjyrgtNAvOqxmoyAaYc8phG6gvDDMlH9uLPTRhumK0k=
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

Switch PF VF-context provisioning to explicitly allocate IDs from
the dedicated shareable ID pool.
Also, lets remove the legacy GuC ID reservation API now that all VFs
provisioning paths use the shareable allocation helpers.

Assisted-by: Claude:claude-5-sonnet
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 .../xe/tests/xe_gt_sriov_pf_config_kunit.c    |  5 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 22 +++++---
 drivers/gpu/drm/xe/xe_guc_id_mgr.c            | 56 ++-----------------
 drivers/gpu/drm/xe/xe_guc_id_mgr.h            |  2 -
 4 files changed, 25 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
index e6eaa94d4d30..4d72411cd570 100644
--- a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
@@ -68,6 +68,7 @@ static int pf_gt_config_test_init(struct kunit *test)
 		.graphics_verx100 = 2001,
 	};
 	struct xe_vram_region *vram;
+	struct xe_guc_id_mgr *idm;
 	struct xe_device *xe;
 	struct xe_gt *gt;
 
@@ -102,6 +103,10 @@ static int pf_gt_config_test_init(struct kunit *test)
 	pf_set_admin_mode(xe, false);
 	KUNIT_ASSERT_EQ(test, xe_sriov_init(xe), 0);
 
+	idm = &gt->uc.guc.submission_state.idm;
+	mutex_init(&gt->uc.guc.submission_state.lock);
+	KUNIT_ASSERT_EQ(test, xe_guc_id_mgr_init_shared(idm), 0);
+
 	/* more sanity checks */
 	KUNIT_EXPECT_EQ(test, GUC_ID_MAX + 1, SZ_64K);
 	KUNIT_EXPECT_EQ(test, GUC_NUM_DOORBELLS, SZ_256);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 9445e5f32fe8..bd55617295fd 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -889,7 +889,7 @@ static int pf_set_spare_ctxs(struct xe_gt *gt, u32 spare)
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
 
-	if (spare > GUC_ID_MAX)
+	if (spare > xe_guc_id_mgr_max_shareable(&gt->uc.guc.submission_state.idm))
 		return -EINVAL;
 
 	if (spare && spare < pf_get_min_spare_ctxs(gt))
@@ -906,7 +906,7 @@ static int pf_reserve_ctxs(struct xe_gt *gt, u32 num)
 	struct xe_guc_id_mgr *idm = &gt->uc.guc.submission_state.idm;
 	unsigned int spare = pf_get_spare_ctxs(gt);
 
-	return xe_guc_id_mgr_reserve(idm, num, spare);
+	return xe_guc_id_mgr_reserve_shareable(idm, num, spare);
 }
 
 static void pf_release_ctxs(struct xe_gt *gt, u32 start, u32 num)
@@ -933,7 +933,7 @@ static int pf_provision_vf_ctxs(struct xe_gt *gt, unsigned int vfid, u32 num_ctx
 
 	xe_gt_assert(gt, vfid);
 
-	if (num_ctxs > GUC_ID_MAX)
+	if (num_ctxs > xe_guc_id_mgr_max_shareable(&gt->uc.guc.submission_state.idm))
 		return -EINVAL;
 
 	if (config->num_ctxs) {
@@ -1173,20 +1173,28 @@ static u32 pf_profile_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
 	bool admin_only_pf = xe_sriov_pf_admin_only(gt_to_xe(gt));
 
 	if (admin_only_pf && num_vfs == 1)
-		return ALIGN_DOWN(GUC_ID_MAX, SZ_1K);
+		return ALIGN_DOWN(xe_guc_id_mgr_max_shareable(&gt->uc.guc.submission_state.idm),
+				  SZ_1K);
 
-	return rounddown_pow_of_two(GUC_ID_MAX / num_vfs);
+	return rounddown_pow_of_two(xe_guc_id_mgr_max_shareable(&gt->uc.guc.submission_state.idm) /
+								num_vfs);
 }
 
 static u32 pf_estimate_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
 {
 	struct xe_guc_id_mgr *idm = &gt->uc.guc.submission_state.idm;
+	u32 max_shareable = xe_guc_id_mgr_max_shareable(idm);
 	u32 spare = pf_get_spare_ctxs(gt);
-	u32 fair = (xe_guc_id_mgr_max_usable(idm) - spare) / num_vfs;
+	u32 fair;
 	int ret;
 
+	if (max_shareable <= spare)
+		return 0;
+
+	fair = (max_shareable - spare) / num_vfs;
+
 	for (; fair; --fair) {
-		ret = xe_guc_id_mgr_reserve(idm, fair * num_vfs, spare);
+		ret = xe_guc_id_mgr_reserve_shareable(idm, fair * num_vfs, spare);
 		if (ret < 0)
 			continue;
 		xe_guc_id_mgr_release(idm, ret, fair * num_vfs);
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
index 5675325665fb..20ce16bda973 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.c
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
@@ -124,9 +124,13 @@ static int idm_init(struct xe_guc_id_mgr *idm, unsigned int usable, unsigned int
 }
 
 /**
- * xe_guc_id_mgr_init() - Initialize GuC context ID manager in native mode.
+ * xe_guc_id_mgr_init() - Initialize GuC ID manager for native.
  * @idm: the &xe_guc_id_mgr to initialize
  *
+ * This function initializes the GuC ID manager to manage the full range of
+ * GuC context IDs (0..GUC_ID_MAX - 1) for use by the GuC submission code.
+ * No GuC context IDs will be reserved for sharing with VFs.
+ *
  * Can only be called when the device is not in SR-IOV mode.
  *
  * Return: 0 on success or a negative error code on failure.
@@ -287,37 +291,6 @@ static int idm_reserve_chunk_shareable_locked(struct xe_guc_id_mgr *idm, unsigne
 	return id;
 }
 
-static int idm_reserve_chunk_locked(struct xe_guc_id_mgr *idm, unsigned int count,
-				    unsigned int retain)
-{
-	unsigned int total = idm_total(idm);
-	int id;
-
-	idm_assert(idm, count);
-	lockdep_assert_held(idm_mutex(idm));
-
-	if (!total)
-		return -ENODATA;
-
-	if (retain) {
-		unsigned int used = bitmap_weight(idm->bitmap, total);
-
-		if (used + count + retain > total)
-			return -EDQUOT;
-
-		id = idm_find_last_zero_area_in_range(idm->bitmap, 0, total, count);
-	} else {
-		id = bitmap_find_next_zero_area(idm->bitmap, total, 0, count, 0);
-	}
-
-	if (id >= total)
-		return -ENOSPC;
-
-	bitmap_set(idm->bitmap, id, count);
-
-	return id;
-}
-
 static void idm_release_chunk_locked(struct xe_guc_id_mgr *idm,
 				     unsigned int start, unsigned int count)
 {
@@ -475,25 +448,6 @@ int xe_guc_id_mgr_reserve_shareable(struct xe_guc_id_mgr *idm, unsigned int coun
 	return idm_reserve_chunk_shareable_locked(idm, count, spare);
 }
 
-int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int count)
-{
-	return idm_reserve_chunk_locked(idm, count, 0);
-}
-
-int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count,
-			  unsigned int retain)
-{
-	int ret;
-
-	idm_assert(idm, count);
-	idm_assert(idm, retain);
-
-	guard(mutex)(idm_mutex(idm));
-	ret = idm_reserve_chunk_locked(idm, count, retain);
-
-	return ret;
-}
-
 /**
  * xe_guc_id_mgr_release() - Release one or more GuC context IDs.
  * @idm: the &xe_guc_id_mgr
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.h b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
index ed9970829a93..844d68440b0a 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.h
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
@@ -31,8 +31,6 @@ int xe_guc_id_mgr_reserve_shareable_locked(struct xe_guc_id_mgr *idm, unsigned i
 					   unsigned int spare);
 int xe_guc_id_mgr_reserve_shareable(struct xe_guc_id_mgr *idm, unsigned int count,
 				    unsigned int spare);
-int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int count);
-int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count, unsigned int retain);
 void xe_guc_id_mgr_release_locked(struct xe_guc_id_mgr *idm, unsigned int id, unsigned int count);
 int xe_guc_id_mgr_release_usable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
 					unsigned int count);
-- 
2.34.1

