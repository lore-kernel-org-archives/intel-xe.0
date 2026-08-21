Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29ABBC5DF87
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 09:46:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0E4010F296;
	Fri, 21 Aug 2026 09:46:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XULkn2Wf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAB9C10F296
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 09:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787305578; x=1818841578;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=6q5dUASAO/waE3Pyx50TLFshSw2EBsAQxBxrqysVULo=;
 b=XULkn2WfX7jBL8EH/HrWpRNMFN/kKoCP5/kLAbSAjl1pywoUDamiH/as
 Gfli6l4BFJD9QpLN8mw3lCaSo8zMonchbr8h0zsnW8XOu8mfzxXoSVDJR
 8FhFygde+14LcmYxcik0TDpHImXYPNGwXaHw8W3VrZtWTw2jeRojXWcpE
 LmCyaaghOlhXEJ6VWU+TrNCqx/U0kL37JPfEzogdZNmuwbyH+uciWtboz
 Mity68BjYeidSB4+qoxDVD7Vhz5eDKWvyArKyCItKi58PWlYjbKmnm/qf
 Wxv2IoSRhTt8gBRgXk4EXNM3l7wfiBob+rFgVcuTSHb7w314kQAqgDqPc g==;
X-CSE-ConnectionGUID: ooZ6KQ9ZSY+GQwMtJHVzBw==
X-CSE-MsgGUID: KDMAWRjwR/Om4DBk0JOMDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87770385"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="87770385"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 02:46:17 -0700
X-CSE-ConnectionGUID: fd7pcYUDSpaNrCJ7uq6uZQ==
X-CSE-MsgGUID: 6GUDx3NTRm6RdAnSqrJd3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="270521594"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 02:46:17 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 02:46:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 21 Aug 2026 02:46:16 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.12) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 02:46:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JCn3kWUkHSQu/jeqe6HohTmpfsTVodVM5Bmm9ofdeEUMU5+jTVwhOcWOALyHNpqn1Z7+ElF9iIm83Pl02E5+reyKM9zed9slGuh3BVU7bHrtXgQtrcxX9w3BMBhBs/sU9NH3lLJm7UpWkP6hDwuKjM02ekwwa/mmww7TbdqSEeaJEz53gS5SLfC4JVwOByX96uxini6PV/l/5LkSwVNlP5Z17oiDlcPlTPiQhP3QnT38CZWkj5TTZiuyraFdYfVhRE9AG7GmLxswqQVZLhLHTXrYkukButafMsUojm7h0hGgqaIjp0KT4+lEDnisoVq0xLZc972RnHbGk6n+6ey8PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kEo9vheV3JxEMLlFrk2ZGXgeiLokzsrwB5p3cG7AyO8=;
 b=PWJaerAfx3Op5zMgrSSKGDtku1sVW7eBlPmbpviM+/cDH8z6VN+NJ/SDmyTf4HLK3FspbIkG4a1sLFJ+d4Fst8Boq4dDKWI0k0tqRTsPgq0VsbYJzzX3QvJ2svdOuUEVoTvUnyXMi9SZ3CdEf0nxvEngyg4LVDs/IXIiLfGk9rACZVOf6ykqlHRy/dLufi+gJlBJxDEq7wTK56LGhVL7nH0+VSAaOt5Zu8x5oLmM/ke+WPtKZ6ITySat0I/L3KZvfQQIobYRiGc3L5kEcOM1EnoFcQtKLtyqoye/qS2i1ALqCZ0dxuXMAI44HvZbPEkDkrfOjmtmm+1Ri8F1E4gPrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by PH7PR11MB8454.namprd11.prod.outlook.com (2603:10b6:510:30c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 09:46:13 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 09:46:12 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 0/4] Introduce PF-mem VRAM regions
Date: Fri, 21 Aug 2026 11:45:57 +0200
Message-ID: <20260821094601.607060-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0006.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:2::6)
 To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|PH7PR11MB8454:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c992ad6-9f5b-4d4b-f0d4-08deff690967
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|18002099003|56012099006|10067099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: QMfkhlq3pPkrE/D2jPYQWIRHECU/QjRXzcmwSO/3h5UqmgR/PkQL0w5J2TX37dbZ1Pd/dlgKDSqiKqeDhktmxcAEKgy9WfS5O7d06whWzKtRvXSC2CVclJ7TQzDls0BZyqXVBXAkpBjRlX0shCv2OE97OqagwJjMrezEg+E9rDQQMB8NIVpMG5rCYwWWMomzVA+KHvOM4cS/w5w09kwIWV1GOSfMQZQZOuBmMZIr1sTRnXwVjhY8w6d0CDW1CjguqIxlo6WX3/c4FRivv4JReiE6csBDR1FKzT9Grc90RmqIScDXB64xzr2dQZZ42aat2HDZ2/bC8fAd/vg4Nd0mlcTYYmof8Q84XGTe10AiubJyB4e7AHPhwAKNRcY6KO/favk6IdZRP2S5TjWJiz3n8JZ4RtWieryvOwnsTDpO7bXrC9kYJKBh8QgABbhL7GYKpcKyZWo71VnzQkc5NGJZUAh0vYhNj9zXjAVIC/mIsA0jM0zozuBvD0vnXWAAmmRV5HneQEintNprOnEnUClBRpsSYC2JIqCF7AxNT6WoJ9Z2+YkAWLqG6w1hFOoaNDPLF5s72I0WrfSt/zdc4iStQO6sDl6gWk4HHfUoI+noMYyaf/lmq6hM3d5FmMmruBEiLG39raoQNWGOALM7qBjefemvg7LdaOmmMcfehP2mblg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(18002099003)(56012099006)(10067099003)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUJhWXlDL0hJNzM3Nm80N1cvNDVpaytpSkMwbUtZbW96YXR4UGl4YzdSL0Rv?=
 =?utf-8?B?dUlYSFBESERyaW9taURuRkVjb3NjYW1kYk5heHp4aTVOaU51MTN4aUw2ZGd0?=
 =?utf-8?B?M0k4TUgvZ0lFTU12WDRQVmF0YTFsanJqck9MU3A1QVQ4V25tUUZHWm9BazJM?=
 =?utf-8?B?R3FGZUdwTnlGc2cxejlqem5NSVFpZGFlTE14VEFqWm14bDhuNTNBQXZHYnlY?=
 =?utf-8?B?RG43UVFxTVpEenZrQmJEbmdicnpWVXk1eHFKVUE5K0daZllOeFpnR0VHN2ta?=
 =?utf-8?B?YlFTZXVTbXFtcFVjYjlvaUtpQTNuV0x6ZUsycnNpeG92ZWJUeE9RMTMrelAw?=
 =?utf-8?B?TytSSTEycEFESTdTNnFIZ2Y5dk5wTGhEL245dFNpQVdneEtob25GcVVoeFFU?=
 =?utf-8?B?UlVLb01lK0RSMG1ZOHRPVFJyV3FVQXlhNzBlUTZrSFBuK2VpMXZLQTlrYUpz?=
 =?utf-8?B?VHJ5YkVuZHFtaFJnSTZBazJIUmtHOGRneTM0MlRuQ2tBcGN3T21SZWpGRUpi?=
 =?utf-8?B?dGdUR04ySjBxa1FOMTRqWER6dER0Q3YwNWJJVFBseVg1cjRlSU1jMDN1djZy?=
 =?utf-8?B?UUFvWEN3emJqY2JaWWtNR29yVCtjVXJOZWZsVno2SUZlMjhFM3U5K3V1VmNr?=
 =?utf-8?B?WmRlSjFkbDdlNnJCbTgrMUhabVZjZVZNa0M3bmJiR0Z4TkpoYWVGTTJrWlA0?=
 =?utf-8?B?MFFDc2FxbHBwWDJrMmV4TUh0VThYd3JtTTYzNkNIbm5EK1dLN1drK1NXaDFE?=
 =?utf-8?B?OVJRZVF5NkhxbGUvamRIajB0N2lRUXFYbTE1NVhzaDRxS3ZpbFlRZU80a05k?=
 =?utf-8?B?TWE3OWF5dm4wQUhseUtMcXRyREhObTdaRHVUdy96eUVnNzhZKzZOWjFQbFhl?=
 =?utf-8?B?K2J2TFpPb3VzdStuNWYyb3RVaEVQcmhOSjZmMlhkdGtuWS9vaHRmR0V4b2Z2?=
 =?utf-8?B?dkFiY3FIZTl6R2Y3YmlCNzNUejUyTG9JNVZHRVZBRGNZV0FGdFQ3N0JpSFkx?=
 =?utf-8?B?K0d2NmJObkRaeUk0d0xPY1pKWmFpMDA4Q3ZaeHc0TG1RcXZUZ1RCTitWNGVR?=
 =?utf-8?B?YUVyR1Nhc29WaWYxUkVzMzFlNUlJUUNvS2F4amNzT3Ura3ZaekdnMmIwakIz?=
 =?utf-8?B?cjErN2dFZGV2cnBycTNkWUlJdW5iMW5QUmpwTFg4U0dOUGc0RzJlZ2o4UERW?=
 =?utf-8?B?WUR6bGdzSUYxVmUxNTdWbzFmUmxsOG9xR1VaaEF0K09vN2VwSnp6cnhpSUlw?=
 =?utf-8?B?ZnJYRzRjUWhscVdoZElTWWc1VHZaTWpKUEFqczRoUVVKd2NvQ2ZxQzBhNHBO?=
 =?utf-8?B?NXc5Y3N4eTV4dVplWk5aL0VVNVFNc24wd2lBaElCaG5ZakxEK1QvTDJ4WWVO?=
 =?utf-8?B?Mnd5dWVPdlVyVzdtd3VLLzcyL1hPYXRzWS9BczR3WXZ5dDNvKzR5OFVPUm92?=
 =?utf-8?B?cW1uTFZXb2hjOUVNMENkZWFRQ05YVFFPZDRMQVpLN0NQcGtRK25SVmpLUFA3?=
 =?utf-8?B?QTJIdFpyNHhITVZWYkFhSlY4VGpzMmNzRjBQcUxYTFBKZEtLeno1RmJGYmdm?=
 =?utf-8?B?bXlsZmpoSkNkeXR4ZWdPQ1VBbzRGRmJXa0RPd3M3QnBXeWE3TE9QNFNwK1hZ?=
 =?utf-8?B?NS9OS2NiQ0UwM1ZPMGlWZ0diZ3JKem5RcmltUlZuN0xZN2NLWHFseHlKN29V?=
 =?utf-8?B?NjJjL2l5b0NZTVE3b2dqdkNlSmZUbDZHSlhxM3N1WFFIRmxZeTYvemt0NEY4?=
 =?utf-8?B?NGRQUitFNGhwNVNwWTVPdkdTMThYaGN5cERGQ1dzY0l4YkV0eEF6WUVaQ2Vr?=
 =?utf-8?B?UVEyZ2diVzBCRzBHRkViWEI4ZEtZWE9jZitQd0dyRG5zc2xqcHJpVHVtcmE5?=
 =?utf-8?B?TGJ1MUgrMzRiNVVnYVMwVXhyRVNQUzNjOGxEQ0dFZ1Q0ZW1MSTF0eDMrTGFG?=
 =?utf-8?B?OHV3QVhCcUd0ZHJoRzV2aHAvMDVnY2xSZUsvNE9oU2NxY3BSYlh5UVRHVFhR?=
 =?utf-8?B?a1hEMi9yNlRZaitEdnJUV2M4L3MxUGFGUzI1TUl1UTIzcjhCbWtCK05IOFdN?=
 =?utf-8?B?ZzBYMnVMenlsSEZUMGRpSEdnZHJrRW94T2lLUXpPaWQ4MmpmVVBRdkpRNkNk?=
 =?utf-8?B?cVVyVENBMmVnaGszSzQ4YjZLVEUvUldzVzN4NTBjdnR3ajdNclpNbXBPNmdR?=
 =?utf-8?B?Y0doWEpZeUwybm5xcTJPLzZWV3FLbitjRmNtaExZVlRjYzRmWUNZZ1pZbEpm?=
 =?utf-8?B?NHRrSmhaSnByTU1OazBhREpGTWtnekc0TzdLOWFuT2FBZ21JajViU0R1dWJE?=
 =?utf-8?B?LzZFU0dYeTR3bVVhRURBUm1BQkRzWGc3RXBOeXBRNEJ2Z1RUTjVZQkhmR2tO?=
 =?utf-8?Q?BJ+OsCEQs4KPV8H0=3D?=
X-Exchange-RoutingPolicyChecked: L3JMyRxmj2ZUVelNDHieE5TyNZDU/qRpb1eE563uAxcCtEqGqS/KVXiVgas2xN7OinvDus011VBTK/Uu+FJANyOuvdIBf16+i6M05oPGr09r94BTKzuGvc4/lZdaJe1It+EtanWayK8b3uzx6jAhF+1yJR3IGDhcJzBmPKHhN+iviUTRVUS09WW9IeFe3Zh0/jUpXl8iqY9VsITALEjfysrLefPssFjhfN7FGQDZMOpCEVRD85jqTFZ2Yj+b+kZQmXz/sF+0InBnL35KPchvzoGiJGjtQlezTWGGDDkvmavN1WHDM58Z1TQmqygj6w+ngIjiSFoo5LblsP8Pgz4p+Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c992ad6-9f5b-4d4b-f0d4-08deff690967
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 09:46:12.8836 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IFTBWZk6INBM3NRfTMmovazxy5AVIEuefCBDZiH/gGqYI5xVFReYoJ5e8t370PFZXmmir5l69QPNJQtZcapI8AWF+i1iYok/4/wITn3QTpo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8454
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

This series lays the groundwork for PF-mem regions: VRAM regions
dedicated to kernel-only allocations, where buffers are allocated
exclusively by the kernel driver and are never exposed to userspace
workloads.

Today a tile exposes a single VRAM region shared by both kernel and
userspace allocations. Some use cases need a separate VRAM region
carved out of a tile and reserved for the kernel driver only. For
example, on an SR-IOV PF most of the tile VRAM is provisioned to VFs;
the kernel driver still needs its own allocations, which must come from
a region reserved for the kernel and kept apart from the VRAM handed
out to VFs. That reserved kernel region is what PF-mem provides.

To support this, the VRAM region abstraction needs a way to distinguish
regions by purpose, dedicated TTM placements so the BO paths can route
and evict such buffers correctly, and helpers to create a region from a
caller-provided parent, offset, and size.

v1 -> v2:
 - Add comments explaining why PF-mem is excluded from user BO eviction
   (Sashiko).
 - Resolve xe_ttm_vram_mgr_alloc_sgt() physical address via
   xe_map_resource_to_region() instead of the tile's
   VRAM region (Sashiko).
 - Enforce page alignment on offset/size and guard against a NULL
   parent BAR mapping (Sashiko)

Piotr Piórkowski (4):
  drm/xe/vram: Add binding information to VRAM regions
  drm/xe/ttm: Add PF-mem VRAM placement types for TTM
  drm/xe/vram: Add initial support for PF-mem regions
  drm/xe/kunit: Add tests for PF-mem regions

 drivers/gpu/drm/xe/tests/xe_vram.c   | 115 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo.c           |  16 +++-
 drivers/gpu/drm/xe/xe_bo.h           |  17 ++++
 drivers/gpu/drm/xe/xe_bo_evict.c     |   7 +-
 drivers/gpu/drm/xe/xe_pm.c           |   4 +-
 drivers/gpu/drm/xe/xe_res_cursor.h   |   9 ++-
 drivers/gpu/drm/xe/xe_tile.c         |  10 ++-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |   9 +--
 drivers/gpu/drm/xe/xe_vram.c         |  90 +++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vram.h         |  10 ++-
 drivers/gpu/drm/xe/xe_vram_types.h   |  14 +++-
 11 files changed, 275 insertions(+), 26 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_vram.c

-- 
2.34.1

