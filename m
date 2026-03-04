Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 493E4EB7EB2
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 09:16:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0538810E985;
	Wed,  4 Mar 2026 09:16:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E9kcbMwC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00FB810E985
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Mar 2026 09:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772615772; x=1804151772;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=KlUlV4QiZEM4pnZUKTpFKb7uD0LMQJeoygMI+WVDZAE=;
 b=E9kcbMwCuAftbomOC0FaHkhWot9Iskt+o3HbC8JFk9va2OqvCE7YbI+O
 kSSK5WynUQK7p+GO1cFCqjw0nlYqMxXP7OV6b4IkUs+FLi3aSlk+LSD8t
 Gf2mpBiwalzPr3019r5RFEdpxmb0u1qS8tLP0QXxFr0Sf3HknEgDSoRUj
 PUKAcZXWoqvCWPgs6oURzkvKPGunz3E6FOeFeWEJy7ULQ9mro53rBi5gF
 7aWqtRbfh2l/YG1g9xionkVLpp1bRcsUP7Ky7s9Ivu8PUi6rBu5YryST2
 TQ83Y7qhFpz36yCbqsoj92ZRFgeUFG1HalI/QmMDWpdV+PzK6/nmkZ/l8 g==;
X-CSE-ConnectionGUID: wTOm51CyRiijq1uE3usq1A==
X-CSE-MsgGUID: 5HPhpNILTc6FNkomn4LbVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="96281629"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="96281629"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 01:16:11 -0800
X-CSE-ConnectionGUID: cqQOD9NBTRaN6pF8ygg44A==
X-CSE-MsgGUID: Rn0JCpeuRPmTHgTz0R82Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="215253793"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 01:16:11 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 01:16:10 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 01:16:10 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.67) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 01:16:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NZZTIlyv8suSVfGbBvXpw99jF3U2hTZh0rcfqMLrzuT69XhOrYDmfmZJMexmwglK+X4G8YEDuCJikZYMH71HWjcGE71vkCJtyw+1emGrXGXCWI2hmD8Q1x5I08ue3ue+uh/4Mwen/BPt9wsJZznbfgbNznXuBcda1aC4nTyV49ceOJIaJ4zkmyI1H0c3v7nkxa5w8yBWhIQKgg/6TUIjIBOfQD+kv1X+zND+1aH21yKoOlktE9zD6eR16T4mK1VZkLKjIuFSQBOZ7rjjy89Dltyt9FDAOG6N+LTknAkoHlqFnFLp/4rfESABUee4DJvfpxrsjDBLqNbNmItvjQ849g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QqEmkk0X/NV/bTKThMXwTcjfTYMqVcxEkq1HymSbbQ=;
 b=SOmzcwxbSVAVU+i6yRTjatvqIOhKR8DPXJxF+WD3t9YkzXlwjMjFxKGrlYh5CP0mIOTiBwRf0lJEIW05qhao1FJYTcl5niKufz/I+Jte/LfiLcwfTx2qA5YAI57Hld28EnD2rILz3scWgYPgeQluGKCGb3dBwUEPVXpX9tRSoemCk5JFlIhjatMVeG9V4eIJrwLLXePydH9Wv/nPt//zXQRbwJ/x1mqE3SGUUH55+97T9t4wJ2v3za/Pb1zF+DGhAcUnEs0xo7Qyh5Rl53m4bRZjAq9iPGoTpZqZzoMTODEL0jwJIwJ7ql/GdNQksr4n/e018Hwt/Gw86iVwrwXrmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by MW6PR11MB8312.namprd11.prod.outlook.com (2603:10b6:303:242::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Wed, 4 Mar
 2026 09:16:08 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0%6]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 09:16:08 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: [PATCH v1 1/2] drm/xe/pf: Add early VF FLR prepare state to PF
 control flow
Date: Wed, 4 Mar 2026 10:15:04 +0100
Message-ID: <20260304091505.732528-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260304091505.732528-1-piotr.piorkowski@intel.com>
References: <20260304091505.732528-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZP191CA0035.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f8::27) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|MW6PR11MB8312:EE_
X-MS-Office365-Filtering-Correlation-Id: 311fcfc7-2191-4d7c-88a0-08de79ceab75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: fQxdXiSusSr9tpHr+98CwpzgbenqUNKSsJBjMqOotCSiUkOWziy3FxJNFEn0lXHhbsxJNj6zCGN/SnU2BXrqTwcwMhx8Syg2AbY+qxMj6YY1TMevVvO/Hfu6mK708G3fdgeapCTIxtIppgutZui4TqHYFxOWA5JUdl9QVYFiFEmUwLse86frG66ILMDXwqgjM/xWTzga+/YICBp9vaXiVeJhOjMl9Aglu2SwOBgJhJhBOoKVPN9i/ww8kcrM97YK2j8N+A3u5i+fCDlz3ZiEyypclTdhE6QIip6sUE3fqhMMPBjgj01RoBXCB+6vQjYrYq8ZTdTJuYOf9AZaC2P1iSYHuIDQwLD8kVYWbUr5XYBc5hqHtxFDqYnlYmMkN/s+DOKKPVvs6V8nRyCFW8k6hqtzXnYdBgWqr7ZnlmzAguOvN/hD5hki9Jg4p31AYGgjQypkSowcSyEmgkW3TVsGaKOGFQ2OIONuGTQZglzZtPe2cPx6uS9vxEIAb8m0PBbm44rMAQ5DNMPukSR1XZ9yPNUlcRFoCGJUCKbyJolNdwmZ9JEZh/ujnDQ2rInUd8V8AuWZ9B4gyFoRuROPvVn22rVrfzBU3ZhgMpnimn3o/I9IoWU7QnWad+JjjOV4/wx0SHYnCMWRp6ixMXvaxvUHvnsmnQjxq1HdAloZqT4Cv+Mas02uDhTTY0hJKdoKyaxv9NQI3r63rDWQYp1Lco7tumM0DsCbevChFMayW73PDuc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1FNQ21aMXFhYmRlNFZ6d3FWU3hVOUxWeFJ1WnJYcnNhanNySUFuT2xuUUFS?=
 =?utf-8?B?cWpZUThhTUxJSzlBWVVLTmNvamhkYXBpY3g4ZlNMdW5sSzhOcnNDNmY1cU9r?=
 =?utf-8?B?WEFFL2tBY0R4cFQ1bCtMUXFESWtuMWpac0xIWFFMRzQvZTNzcFUrZCtwQVcw?=
 =?utf-8?B?bnBrbWs2ckZMLzAwQ2dGT2Z2Zk5ROWZFTnN0L2pZbWY2Vis1a1NTK1YzN3d0?=
 =?utf-8?B?Y3B6cDRzQkNIRHB2N1RWYzlwcHBMN0p4b0w1N3Jaby8zbkJ4YW5hQ0I4dDVl?=
 =?utf-8?B?Q3lQWWd1WDM1MFhFZGovaXA5VGtIUC94cUcrQ3JJME5oYkJhMzFycVk1MDB1?=
 =?utf-8?B?K2NONi9Ea3lORWFKMitGRGtFcmdxaUJ0ZVEzbXZuM1lVR2tLTWdzWExIMW9J?=
 =?utf-8?B?ZVdSeGpYZnBUQS9IZnNqMFhRTWNwc3RkWVdnTVNpMSt5bkVSYXloTFhrZmNz?=
 =?utf-8?B?MzZjT2U1YTRtcUVScmdwS1RwWlZJbmNwVDNXT2pZemt2Zi96UndLbUFya3Bz?=
 =?utf-8?B?M1k5RkJNVXRpMTkvNXhBZno0Ymlydi93bXpkS3NvTEEvTXBmNmtjSDc0UXhU?=
 =?utf-8?B?NW1iRzJYZTU3N3prMFQ4cTdrb2gzRC85R20zQmlqZkVXME9nQlF4eXQzeUdE?=
 =?utf-8?B?QVlBSGZEdU0zVXJSamxyWVR6aDFqbDhDS0FNTjZPWnRoa0JiRktZQ2loSTdo?=
 =?utf-8?B?RDZtbUw3cEJGTDZPNDF5YnRBRGc4cTBybGQ2c3V4bitsVGtxZGJtQjV1VkFz?=
 =?utf-8?B?U283T05kakJXam1JdFFJYlhaOXJJQ243RlFqOHRhV3c1QXNoNUl2Q2dteE1u?=
 =?utf-8?B?OHZhT0h2ZGd4MmhLa0RCZDVpK2VJdmlxakdwSmJNenFxRkxNTTUzTEl4RllT?=
 =?utf-8?B?UDFTOStJYm55UGZhT29rcFB3WG9OaVQvSk5CcnpVbmRuTmlTZDFUNDdtbXNL?=
 =?utf-8?B?WUpiM28zakxTNEEzUUNDZzJDclU3b1hSZC9sM0duc3VGcGJNTWFwRkdTSkhC?=
 =?utf-8?B?RlRpUWR3cDVwUmZURzZ3bUsxcGRHRHZNV0NyVHd0aGdJaWVhYWo0TkxlZzE0?=
 =?utf-8?B?Z215UDVSWVRmZlJkditPaWxrZUFOdXpid294MFRxVUlKb2FOMnMvVEkydHhM?=
 =?utf-8?B?SnNQaUNXN0FvMmJ4eW5wZFFxdUpSai80Z25KVWhoOENpYXNDZmFLQzFhRlk1?=
 =?utf-8?B?MjNuRHhhRXRQVTFtMFd2QSs5N2t6aitPWEZMalA2VHphSFU1c282bXRuVlpj?=
 =?utf-8?B?RkhtbFRqZ2FjNmowekQyTDdMd2xtT0E4elJ3SUErWU1kVU9UU0ZFSVVraVUw?=
 =?utf-8?B?SUx6MS8rdmJvOUI0RXBPTGpOZjRTUitZd05HQ3R6RFREUDU1dDMyVGtuZDFI?=
 =?utf-8?B?K2dxZ2ZUMzlMVTN6Myt4R01NcXlQcTVjMkxaMTcyay9hNGlGZzVmbFA0bjJw?=
 =?utf-8?B?K1pXQXRCejBnclRxRG1FcDIwR3BNZkQ5WERybCtuWkw3ZGFRakpxUnM3NGRu?=
 =?utf-8?B?cnZhenE3bG1jV255TE15Zmk2dnc4M2lFT1MyVVFzWjg3ZjMwVEoxYXQxWHBy?=
 =?utf-8?B?NjB5YWJKaTFmcU9nS0g3WDZ2QlNTdUhYSTlBcjRVcVdZWHFmYmtWaFdLeHJ4?=
 =?utf-8?B?ZVQzcDlnR0dWeGhpRmo4SUw0ckJnd08vVG81dE15ZW1WOHorT2kxTjV3MGth?=
 =?utf-8?B?L0ZlYlBMQlZXZlZZSUxHeHVrc2llajhLNDZkdzBVa2NkYjNTcFJJb3ZxZmFy?=
 =?utf-8?B?UzBjRlM1RnJUR29YYm9rMEk0UnNoOS9TZndZTXFudmdxcjhBK2JiV2tDeXF1?=
 =?utf-8?B?OWNuT1BhNG8ySHRkdVZsR0VMdFo0ZldMeUxpanlhQ0FxdHhxTVJpaWdnTlli?=
 =?utf-8?B?bC9LRmZuOFpoNWJrTzd6ZDNVeG40bTVkVVpjZWRkL21tYWlsVWh4dUQ5TEFU?=
 =?utf-8?B?M3JmbW0wL2tOVkVEN1EwZk9GS0FGelNmWmFXRzZ1cmhHQXNxMnNOQmZwTjR6?=
 =?utf-8?B?d0VoeTZwWHNiVmZHeXluMEhPWTRwdWsvVkdBNGFsK25NZk9JR2lzb201NEZQ?=
 =?utf-8?B?MXNjb21tMCtsTTJQeWlOa1dkWDNFMFF3MWM0UTNDRFB4Vk9HNlpxUEhDaC81?=
 =?utf-8?B?QU9zWHVhb1N5UmhFUENhZFVaVFdoN3pJMkpqakNhRmZTMmFQdzhqNmM1Z1F3?=
 =?utf-8?B?dkppV1BidENPRS82cFVUenhFT0NJQUtUU3dxTlptZ1hRV1FONkFNMVg1VHd0?=
 =?utf-8?B?SXF6bHJpRzRBbzJRalBkRGtIQmJXU1ZrN240bWtwblVGZFNXMldYSC95N3Z6?=
 =?utf-8?B?SEJlbEZzQWphc2oxeHhoR01mSXFQRTJQTDh5bVJIbDZ3akI4dmQ2QmQ2bDNE?=
 =?utf-8?Q?ANDgqFD78wBAZ6WY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 311fcfc7-2191-4d7c-88a0-08de79ceab75
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 09:16:08.1726 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 52nZwxDA6KhZO4n3j+4IfJcfJ0FpZ0VDwrtVkUnK9WYrg0+lanFqnST3F7FQsQ9GWZ+Tl4+yuF6Lz0R7Jkb6frcnfJXKoafunxZyu7Ha36U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8312
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

In some cases, when an external component (e.g. xe-vfio-pci) waits
for FLR completion, it may start waiting for "FLR done" before the
driver is notified about the VF FLR. Due to notification latency on
the HW/FW side, the PF may receive the FLR notification only after
the wait path has already been entered, which can lead to
the external module treating the FLR as completed before it
has actually begun.
Let's introduce an optional FLR_PREPARE state to allow early
notification of a pending VF FLR before the GuC FLR event reaches
the PF, to avoid this race and guarantee correct synchronization.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 45 +++++++++++++++++--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h   |  1 +
 .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |  2 +
 drivers/gpu/drm/xe/xe_sriov_pf_control.c      | 24 ++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_control.h      |  1 +
 drivers/gpu/drm/xe/xe_sriov_vfio.c            |  1 +
 include/drm/intel/xe_sriov_vfio.h             | 11 +++++
 7 files changed, 81 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index 5cb705c7ee7a..7c0b6f19e388 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -170,6 +170,7 @@ static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
 #define CASE2STR(_X) \
 	case XE_GT_SRIOV_STATE_##_X: return #_X
 	CASE2STR(WIP);
+	CASE2STR(FLR_PREPARE);
 	CASE2STR(FLR_WIP);
 	CASE2STR(FLR_SEND_START);
 	CASE2STR(FLR_WAIT_GUC);
@@ -418,6 +419,7 @@ static int pf_wait_vf_wip_done(struct xe_gt *gt, unsigned int vfid, unsigned lon
 
 static void pf_enter_vf_ready(struct xe_gt *gt, unsigned int vfid)
 {
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_PREPARE);
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOPPED);
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUMED);
@@ -1487,10 +1489,14 @@ int xe_gt_sriov_pf_control_stop_vf(struct xe_gt *gt, unsigned int vfid)
  *
  *	 (READY,PAUSED,STOPPED)<------------<--------------o
  *	    |                                               \
- *	   flr                                               \
+ *	   flr prepare (optional)                            \
  *	    |                                                 \
- *	....V..........................FLR_WIP...........      \
- *	:    \                                          :       \
+ *	   (FLR_PREPARE) [optional]                            \
+ *	    |                                                   \
+ *	   flr                                                   |
+ *	    |                                                    |
+ *	....V..........................FLR_WIP...........        |
+ *	:    \                                          :        |
  *	:     \   o----<----busy                        :        |
  *	:      \ /            /                         :        |
  *	:       FLR_SEND_START---failed----->-----------o--->(FLR_FAILED)<---o
@@ -1546,10 +1552,40 @@ static void pf_enter_vf_flr_wip(struct xe_gt *gt, unsigned int vfid)
 		return;
 	}
 
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_PREPARE);
 	pf_enter_vf_wip(gt, vfid);
 	pf_enter_vf_flr_send_start(gt, vfid);
 }
 
+/**
+ * xe_gt_sriov_pf_control_prepare_flr() - Notify PF that VF FLR prepare has started.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This is an optional early notification path used to mark pending FLR before
+ * GuC notifies PF with FLR event.
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_control_prepare_flr(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_gt_sriov_control_state *cs = pf_pick_vf_control(gt, vfid);
+
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_FAILED))
+		return -EIO;
+
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_WIP) ||
+	    pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_PREPARE))
+		return 0;
+
+	reinit_completion(&cs->done);
+	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_PREPARE);
+
+	return 0;
+}
+
 static void pf_exit_vf_flr_wip(struct xe_gt *gt, unsigned int vfid)
 {
 	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_WIP)) {
@@ -1814,7 +1850,8 @@ int xe_gt_sriov_pf_control_wait_flr(struct xe_gt *gt, unsigned int vfid)
 	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_FAILED))
 		return -EIO;
 
-	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_WIP))
+	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_WIP) &&
+	    !pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_PREPARE))
 		return 0;
 
 	err = pf_wait_vf_wip_done(gt, vfid, timeout);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
index c36c8767f3ad..23182a5c5fb8 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
@@ -27,6 +27,7 @@ int xe_gt_sriov_pf_control_process_restore_data(struct xe_gt *gt, unsigned int v
 int xe_gt_sriov_pf_control_trigger_restore_vf(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_finish_restore_vf(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_stop_vf(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_control_prepare_flr(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_trigger_flr(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_sync_flr(struct xe_gt *gt, unsigned int vfid, bool sync);
 int xe_gt_sriov_pf_control_wait_flr(struct xe_gt *gt, unsigned int vfid);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
index 6027ba05a7f2..9e35e29f481b 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
@@ -13,6 +13,7 @@
 /**
  * enum xe_gt_sriov_control_bits - Various bits used by the PF to represent a VF state
  *
+ * @XE_GT_SRIOV_STATE_FLR_PREPARE: indicates that the PF received early VF FLR prepare notification.
  * @XE_GT_SRIOV_STATE_WIP: indicates that some operations are in progress.
  * @XE_GT_SRIOV_STATE_FLR_WIP: indicates that a VF FLR is in progress.
  * @XE_GT_SRIOV_STATE_FLR_SEND_START: indicates that the PF wants to send a FLR START command.
@@ -55,6 +56,7 @@
 enum xe_gt_sriov_control_bits {
 	XE_GT_SRIOV_STATE_WIP = 1,
 
+	XE_GT_SRIOV_STATE_FLR_PREPARE,
 	XE_GT_SRIOV_STATE_FLR_WIP,
 	XE_GT_SRIOV_STATE_FLR_SEND_START,
 	XE_GT_SRIOV_STATE_FLR_WAIT_GUC,
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
index ed4b9820b06e..15b4341d7f12 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
@@ -123,6 +123,30 @@ int xe_sriov_pf_control_reset_vf(struct xe_device *xe, unsigned int vfid)
 	return result;
 }
 
+/**
+ * xe_sriov_pf_control_prepare_flr() - Notify PF that VF FLR prepare has started.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_control_prepare_flr(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int result = 0;
+	int err;
+
+	for_each_gt(gt, xe, id) {
+		err = xe_gt_sriov_pf_control_prepare_flr(gt, vfid);
+		result = result ? -EUCLEAN : err;
+	}
+
+	return result;
+}
+
 /**
  * xe_sriov_pf_control_wait_flr() - Wait for a VF reset (FLR) to complete.
  * @xe: the &xe_device
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_sriov_pf_control.h
index ef9f219b2109..74981a67db88 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_control.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.h
@@ -12,6 +12,7 @@ int xe_sriov_pf_control_pause_vf(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_resume_vf(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_stop_vf(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_reset_vf(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_pf_control_prepare_flr(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_wait_flr(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_sync_flr(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_trigger_save_vf(struct xe_device *xe, unsigned int vfid);
diff --git a/drivers/gpu/drm/xe/xe_sriov_vfio.c b/drivers/gpu/drm/xe/xe_sriov_vfio.c
index 3da81af97b8b..00f96b0976d1 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vfio.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vfio.c
@@ -42,6 +42,7 @@ _type xe_sriov_vfio_##_func(struct xe_device *xe, unsigned int vfid)		\
 EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_##_func, "xe-vfio-pci")
 
 DEFINE_XE_SRIOV_VFIO_FUNCTION(int, wait_flr_done, control_wait_flr);
+DEFINE_XE_SRIOV_VFIO_FUNCTION(int, flr_prepare, control_prepare_flr);
 DEFINE_XE_SRIOV_VFIO_FUNCTION(int, suspend_device, control_pause_vf);
 DEFINE_XE_SRIOV_VFIO_FUNCTION(int, resume_device, control_resume_vf);
 DEFINE_XE_SRIOV_VFIO_FUNCTION(int, stop_copy_enter, control_trigger_save_vf);
diff --git a/include/drm/intel/xe_sriov_vfio.h b/include/drm/intel/xe_sriov_vfio.h
index e9814e8149fd..27c224a70e6f 100644
--- a/include/drm/intel/xe_sriov_vfio.h
+++ b/include/drm/intel/xe_sriov_vfio.h
@@ -27,6 +27,17 @@ struct xe_device *xe_sriov_vfio_get_pf(struct pci_dev *pdev);
  */
 bool xe_sriov_vfio_migration_supported(struct xe_device *xe);
 
+/**
+ * xe_sriov_vfio_flr_prepare() - Notify PF that VF FLR prepare has started.
+ * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function marks VF FLR as pending before PF receives GuC FLR event.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vfio_flr_prepare(struct xe_device *xe, unsigned int vfid);
+
 /**
  * xe_sriov_vfio_wait_flr_done() - Wait for VF FLR completion.
  * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
-- 
2.34.1

