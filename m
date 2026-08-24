Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 218FAC5DF94
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 08:09:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8BF410E38B;
	Mon, 24 Aug 2026 08:09:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O2PMfbWY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBAE910E38B
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 08:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787558972; x=1819094972;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=S+RIy/h7H44Vc/CAnDlliGD32rnxvchR0SwaBpzlcaM=;
 b=O2PMfbWYS0y+LhVFfJfCNBoJU0btGg1JMVKzrm3ao559ArzwtcQUrkK6
 Yx797YbwbzlQfwcjcf+SQHPukEyiWYkfjrZUOVLhBluWF4tPdaqPKAwlh
 tY/L4FAQ/AlUIx3lfHB++4kotWfqh4ziDhReOQOn8Z0pEkkS03IVRizgz
 Yusf3PgnFycJziyGoIkYJiW/mo2VCa4+JEn3SqA0LGZ6K8LGhosvCASZi
 29wM//cRO2UrQDn0df67U2rr4j9bxg5caO8pLBp2XkuCY8WmKzjKIcz2v
 KA56G+GgjF6N2koW/kLZG4HyppRP08nCAYdOQLVA+6eVZ1i4HKJYNqZ8a w==;
X-CSE-ConnectionGUID: A+cq6d1TS5CxTUbio10Tjw==
X-CSE-MsgGUID: snqTeS5vQgqbZEw7p/kqtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="91681487"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; d="scan'208";a="91681487"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 01:09:32 -0700
X-CSE-ConnectionGUID: gHRwxyZBRiuZ9iDuJ9EwiA==
X-CSE-MsgGUID: X1T7wHS5QEepgMhL56kRLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; d="scan'208";a="305135232"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 01:09:32 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 01:09:31 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 24 Aug 2026 01:09:31 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.45) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 01:09:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w96dQrI9IDsjwBQLnvXhHmp2vvwsp3LEkZStaQxvRE63Acqm0GxtCKV+OLGW7K2Meqba3HBDR5foRhUjlpWf/5t1HWcL/n9jsz27o5RcadAZVB8MGpMM5EXSHrw4v05WsWaZDn+0Fl218F+mQY0lopKzVDxplG+3lJMy7ndZ9kuruh4+/nU9Ba/rnVjMoDO0L4yin72ksOo8uaPTLNgV8qgHCeEzQgHnlZNz5e3zKxgwumiKGZ7acZJj+t2Gf3Xznpvyu3p6IrsFTRaF5WNAHQDfjcRwk9a2zOkD5NHRtB5qHs2SjaiZYLc5XlCm+RIN8bzlX6pE876dcctOLvzEPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xdAq2gB2G3/U4+W2rJtwkeBnZLCzj6PxptLSI4hLsVg=;
 b=HtJW5t7/VSjR9xPuXZr9+p1khcYsGl5BbPQo//YS6cFpf3/KPw/kOikUToVN/Vc2I/SHxXUGV1OEsj9yj0D70/iiaGbey+/D3h5IoPLy6j91BsMVgn35YbkLNiNMA9oXf+N5CwEWG1CPI9HZ5x6dwtz0sZjDj3Yjcuqayd4WHbjaA5bgDFKMnXtRpEno/q5GuUlpWNdhmZQstl8ofpk1+PtrkTVTrbYPzZCtzAlrN9RNvyS+UilHuJcD4a8kjXQDqcBhjw44FLC2P3HPATSHLszS8IzSMv7wdleXbq//9HNZIHmDz6+iKhk3f/jJ6aA468X0TdiAWaUnIUG6iGkLcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by BL4PR11MB8869.namprd11.prod.outlook.com (2603:10b6:208:5a8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Mon, 24 Aug
 2026 08:09:23 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 08:09:23 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v3 2/4] drm/xe/ttm: Add PF-mem VRAM placement types for TTM
Date: Mon, 24 Aug 2026 10:09:06 +0200
Message-ID: <20260824080908.701133-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260824080908.701133-1-piotr.piorkowski@intel.com>
References: <20260824080908.701133-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU7PR01CA0004.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::18) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|BL4PR11MB8869:EE_
X-MS-Office365-Filtering-Correlation-Id: c3d9e0f1-bb91-4eba-00ea-08df01b701f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|6133799003|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: vbbCP8NS/539HNwg9xSYPP1YT/q6aQZ/UfubwWN+lVrhkVtsTTjAQPLiq5NjEyLIwwVbxMovA1DmYB8bdHYiZpEq3pya3DdPb3TLMAHyIRV5s9fL7m7BCSiL805AXQp3f6wjDquUnn6oyAxmDO5S3qnMunHd4UbRVrNcHkM4m0NMdhfCDFBaKYCukr1zsuhufR/ykq+CwnkKUZjpqi+7dZ33OwUvSgAXAEvDYwNdm/+Pio+T0VB0XjrpJ58RZomg58C6noHvxVEdEsIsr/5CMCNmUnhB15DqS4DoPPb3BvtSvnELWuqq4Vo1/PvQBHRP7yKhEY2EJGbjUSGX/HVrpFVQuCjgc0w9VurRgvy8tLyZ++w4GDINfiidg6bxxA0LByltsehaMaRqVSz/zzAXz6RRZLZVmC97bxBdNvbEaCIzTbxMb1JDyFE4HEpQ3fN75NqXpSWVFYiYu/Y5Hp3EA4PUYfuuX8vbX9RyJOjKK52kcbB3Ttw+2xTOpo+laozdLwQP8A5ha5xofXYmiK2UEIEohoTfibj+Foz84ME3aI15PAkx7KAbqRRbhynAcgzY6A1p76iUWxF/IDtaNE1Q53qhp+eCO8C9LfsvUrSSySCiiMEQ2tDt7BIB+38lRt+HGYk1vpaVuiPPMUUMIKT5+DYuJiN5i9gQR6BCxDCi1fk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bi9mOVVZbWpnUmk3cW1wOEx6TEFnSkFCN1pnbWlJSmVRREdMU0pTR0UvWGVi?=
 =?utf-8?B?MEJQUncrSGpBbzRRYnJwb0F6OWNrTVdhaTJncUcxLzl0ek9WZDJnbWlKN0F3?=
 =?utf-8?B?Y2x0bnY0Q0YrbHh0YlU0ZERoSGFXb3dhblJTQVIwRmdaYXY0Mm5yT0V4UzJi?=
 =?utf-8?B?ek5nUVkwblZCZ2hKUnNCRGJydWhrSzJSSTcrZmsyZy9yanNBbm9uUnVXUklQ?=
 =?utf-8?B?Ynl1ckU3bG1GT0hINExENWlCaGlMd0NjVnpxTVVWUml4RXJ4NUZHeW5uK2dj?=
 =?utf-8?B?eXV6UE1odjBqY3ZGR0pUSjgzeUZHZFFveG8wZUxCOFRrWmsvMnppY2g3VVRn?=
 =?utf-8?B?MmJiYzhHWTZuMlZNVC9yMTZkYThiRU1PUjh3aDBzazJzd3FQRGJuNjQ4NTRl?=
 =?utf-8?B?eFhqQ0IyUzRFcExkYzc0OEVaR3B5V0NkL0ppRG9rSXkxVkxCVXNGbjN3QkNX?=
 =?utf-8?B?MzhFL3ZkNE51VHJxZUF6QjR4TzVzenFhdHF0R3pJbkFGNjBYdVNmSkNrU0dW?=
 =?utf-8?B?R0d4OXQ3VG1ISWc5SGo5bklGM3c2S3RnNlRsa0IwRUYvVGsxUysyUFlueEhk?=
 =?utf-8?B?bU1HMVpNbVUzNW80SkNwVXg4RkpwUmEyU0FQRW13Y1daWGNtbHZ4ZzFRNGNZ?=
 =?utf-8?B?THBiL0RWV2dzZVFkNldSQXQvZmlhNDRyZTVCTWQ2Wm8rRzdZOFRBbkUxMVpD?=
 =?utf-8?B?WVFlTDhJbGQ5c2c4V24vVlQ4cEhzN3NIWlFINWkreStzcE5sYXdWazFtUEtv?=
 =?utf-8?B?MGRySUEyL0IrTXF4RnZLR00yUFJRZHVtaXM1YkVWWDdVU3FSbEh1R0hQWGlk?=
 =?utf-8?B?dGRUK2xwK1FYMTZRWVdudWE2UytFb2hQYkRLU1dTc1FjMHJnZ3pFemF0V3hG?=
 =?utf-8?B?R0ZHK0VVQ1hXcjc3K1RZbnFzM09JWGpnL1doUTg0UHhqVlQ0RFRoVDRUbEtD?=
 =?utf-8?B?QU9RcW5NMTVrTE56bXo0LzVnRDBaSU1IQ1pnZjdLN0ZSclZiKzYybWx2aGE1?=
 =?utf-8?B?cTZmVUxYSE82NlpiSGlXRlhHNGpyU0FYWFk0c1Iwa0F4SVExeVYxRHJBMDFH?=
 =?utf-8?B?aCtnUjlOOHNyR1hqRkhkQkF2QVdXUlNjaFpROG5weUJaSGJBSk1wTlJBN005?=
 =?utf-8?B?UE5JVVlDZ2M5RDNxSmY2ckY3SFBycWxWNUg2TXlGOXo1ZlNnSzRVOUxzYjNu?=
 =?utf-8?B?T1JEUVM2LzV4Y01HVEVGK1VLSmI1UDRUc0dETkYySTVKUzB6T1F6Wis0Sm1I?=
 =?utf-8?B?ZnBYeThqY1RCdWtVQVBJQmthR21ORjhTeXFGajVGZ2lNNGlYNXJBTW9XOGdJ?=
 =?utf-8?B?d2pDNldsM1UyUWhQWEZUS0R4WmU0WDdBb2FPdGs2Y1Zjb2hGaHd0b2hiR2dR?=
 =?utf-8?B?WkFYZWQvQllCbWNiWGtsWTNJOXdSczJNSnRpOTVSdGx3RGM2Y1JXNEpWMnpY?=
 =?utf-8?B?YjVraUdwdUw4Umt1QUxCVDFaLzFiTGRxd1VOOU96a1VObHdvYVlYSVpyTEx4?=
 =?utf-8?B?WXZ1eHduaG50blVvQkx4RTZvTEUyYWxOUE83VGN1NjFRMnZHRGxvSC91am94?=
 =?utf-8?B?QTA5RVV2YVFiL1I4bk5PbXFZaFVRVXVhOVc0WWxRY0d1cWtDbHBLVEY1Q0Q3?=
 =?utf-8?B?TTBKZnI3ZVFTSkZTV2lDY0N4SjcyejBsdWpMSnFzVzRFbzNVT3d1eDBhck1L?=
 =?utf-8?B?M0hoUnI4MzhhWE5xMkxYeHE5U3o1WGpxTXVNM09XQ1ZtTWdYTzk0NUFYYjhq?=
 =?utf-8?B?NVFocElxUkdqbUR2djdDczNzOHR0a2IwQlVvbUxnT0dqRGNidjhqVDdWbVA3?=
 =?utf-8?B?V1ZQUXlXVW11QXloQ21xZDNGRG1reEp5YStCZHFOZmltejFyUk5lM1FaZUl2?=
 =?utf-8?B?Ky9qTGptRkNIUVN2TU1CVDMwb2k2RVFmK0M0SnJnbjJsOEhJYTlQWkg1MTlT?=
 =?utf-8?B?OTB5SHl1b2g5eUpJU0trbDZxUDdUSkQwTER1dHhSaFVzRGV6S1hwREJYeVRk?=
 =?utf-8?B?RVBUaG1naVVLTjdVYlNHWVZyeERrQzlONVVCTUVuK3crL0V2WFdyL1lCSXlp?=
 =?utf-8?B?S21RTm1Zcy9FcTdvRHNaMWIrc1JSUmNWdjFXR1V0bFh6OXlvSFoxUlY5T082?=
 =?utf-8?B?S1NuMHgxRXI2ZkF2VzVVR2JoTzFQZTJ0TlBjNG8vdm9iUy96UEZ2MHpTWFFH?=
 =?utf-8?B?WklYRE1WZE1maGpIdTBOanUxTExTLzF0Uk9ySkFTYnY2YVI4N0FjY01ibmdw?=
 =?utf-8?B?U09kQkxURnNGcG9MMEVDSzFxUHZ5bXpLYmxFMFRGajZ4VWNyYTc4djdyakV3?=
 =?utf-8?B?aGEycDY3N2UyV2Vndlk2MGozckwyZFdQZnhsajcxcm1UenNMa3VmeXprazhw?=
 =?utf-8?Q?3Vt0hiLu10xNy620=3D?=
X-Exchange-RoutingPolicyChecked: uaA0LcCPLgTtHh35ySAynrlLDU2YoymjkuFOHjctR1jiLvb5MzVmxD8EGf7c7EUqKjxT6TzDHS38WCDciIYhLYXtdlrcoau38Gtl80c2fN2y9lg1nK6sFp/2Wgjr1AoBCt2aLkG1eFYkw/+NMFMQQNAz/iIqsh/d5k8jxwjFPY0lz2i8anTbfWNWiwbN/1Z68kvhqi4epOdOyZEdgQaBid/dsjC3TqR7ZVXN4H+LZ0/X7+8Xetfma/u91AMNRtyUlWZfYv8Zculm5DSxNBUY/O/4sV3WCg7w9UfuvIGb7pdidyYNLhCHhpoSYf+F4DyWs3xFmSzBc8uHHdF1PWFLzw==
X-MS-Exchange-CrossTenant-Network-Message-Id: c3d9e0f1-bb91-4eba-00ea-08df01b701f9
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 08:09:23.5758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dBJRXNylHnyBorD996D2qql20qZJVFCeEqYowg27FQa3KKzUcL5uyxtAW0nErtD/I67q84sjt6Lv5mNaBk2ZmB3Wjd36le92sQ4tiyGLico=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8869
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

PF-mem regions are dedicated to kernel-only pinned BOs. They are not
exposed to userspace and cannot be exported through dma-buf.

Add dedicated TTM placement types for PF-mem VRAM regions and update
the BO, resource iterator, power-management, and PCI removal paths to
recognize them. Since PF-mem cannot contain user memory, its placement
types are intentionally excluded from user BO eviction.

v2:
 - Modify commit message.
 - Add comments explaining why PF-mem is excluded from user BO eviction
   (Sashiko).
 - Resolve xe_ttm_vram_mgr_alloc_sgt() physical address via
   xe_map_resource_to_region() instead of the tile's
   VRAM region (Sashiko).
 - Assert in add_vram() that the requested placement is a VRAM one before
   resolving its TTM manager.

Assisted-by: Claude:claude-5-sonnet
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c           | 25 ++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_bo.h           | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_bo_evict.c     |  7 +++++--
 drivers/gpu/drm/xe/xe_pm.c           |  4 ++--
 drivers/gpu/drm/xe/xe_res_cursor.h   |  9 ++++++++-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  9 ++++-----
 6 files changed, 54 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index dde309821237..91070a0a926d 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -46,6 +46,8 @@ const char *const xe_mem_type_to_name[TTM_NUM_MEM_TYPES]  = {
 	[XE_PL_TT] = "gtt",
 	[XE_PL_VRAM0] = "vram0",
 	[XE_PL_VRAM1] = "vram1",
+	[XE_PL_VRAM0_PFMEM] = "vram0_pfmem",
+	[XE_PL_VRAM1_PFMEM] = "vram1_pfmem",
 	[XE_PL_STOLEN] = "stolen"
 };
 
@@ -166,11 +168,12 @@ static bool xe_bo_is_user(struct xe_bo *bo)
 static struct xe_migrate *
 mem_type_to_migrate(struct xe_device *xe, u32 mem_type)
 {
-	struct xe_tile *tile;
+	u8 tile_id;
 
 	xe_assert(xe, mem_type == XE_PL_STOLEN || mem_type_is_vram(mem_type));
-	tile = &xe->tiles[mem_type == XE_PL_STOLEN ? 0 : (mem_type - XE_PL_VRAM0)];
-	return tile->migrate;
+	tile_id = mem_type == XE_PL_STOLEN ? 0 : xe_vram_pl_to_tile_id(xe, mem_type);
+
+	return xe->tiles[tile_id].migrate;
 }
 
 static void try_add_system(struct xe_device *xe, struct xe_bo *bo,
@@ -231,13 +234,16 @@ static void add_vram(struct xe_device *xe, struct xe_bo *bo,
 		     struct ttm_place *places, u32 bo_flags, u32 mem_type, u32 *c)
 {
 	struct ttm_place place = { .mem_type = mem_type };
-	struct ttm_resource_manager *mgr = ttm_manager_type(&xe->ttm, mem_type);
-	struct xe_ttm_vram_mgr *vram_mgr = to_xe_ttm_vram_mgr(mgr);
-
+	struct ttm_resource_manager *mgr;
+	struct xe_ttm_vram_mgr *vram_mgr;
 	struct xe_vram_region *vram;
 	u64 io_size;
 
 	xe_assert(xe, *c < ARRAY_SIZE(bo->placements));
+	xe_assert(xe, mem_type_is_vram(mem_type));
+
+	mgr = ttm_manager_type(&xe->ttm, mem_type);
+	vram_mgr = to_xe_ttm_vram_mgr(mgr);
 
 	vram = container_of(vram_mgr, struct xe_vram_region, ttm);
 	xe_assert(xe, vram && vram->usable_size);
@@ -360,6 +366,8 @@ static void xe_evict_flags(struct ttm_buffer_object *tbo,
 	switch (tbo->resource->mem_type) {
 	case XE_PL_VRAM0:
 	case XE_PL_VRAM1:
+	case XE_PL_VRAM0_PFMEM:
+	case XE_PL_VRAM1_PFMEM:
 	case XE_PL_STOLEN:
 		*placement = tt_placement;
 		break;
@@ -639,7 +647,10 @@ static int xe_ttm_io_mem_reserve(struct ttm_device *bdev,
 	case XE_PL_TT:
 		return 0;
 	case XE_PL_VRAM0:
-	case XE_PL_VRAM1: {
+	case XE_PL_VRAM1:
+	case XE_PL_VRAM0_PFMEM:
+	case XE_PL_VRAM1_PFMEM:
+	{
 		struct xe_vram_region *vram = xe_map_resource_to_region(mem);
 
 		if (!xe_ttm_resource_visible(xe, mem))
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index e8081af5bfc1..c698f70a3b0c 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -83,8 +83,13 @@
 #define XE_PL_TT		TTM_PL_TT
 #define XE_PL_VRAM0		TTM_PL_VRAM
 #define XE_PL_VRAM1		(XE_PL_VRAM0 + 1)
+#define XE_PL_VRAM0_PFMEM	(XE_PL_VRAM1 + 1)
+#define XE_PL_VRAM1_PFMEM	(XE_PL_VRAM0_PFMEM + 1)
 #define XE_PL_STOLEN		(TTM_NUM_MEM_TYPES - 1)
 
+#define xe_for_each_vram_pl(i) \
+	for (i = XE_PL_VRAM0; i <= XE_PL_VRAM1_PFMEM; i++)
+
 #define XE_BO_PROPS_INVALID	(-1)
 
 #define XE_PCI_BARRIER_MMAP_OFFSET	(0x50 << XE_PTE_SHIFT)
@@ -614,4 +619,16 @@ static inline bool xe_bo_is_mem_type(struct xe_bo *bo, u32 mem_type)
 	xe_bo_assert_held(bo);
 	return bo->ttm.resource->mem_type == mem_type;
 }
+
+static inline u8 xe_vram_pl_to_tile_id(struct xe_device *xe, u32 mem_type)
+{
+	xe_assert(xe, mem_type_is_vram(mem_type));
+
+	if (mem_type >= XE_PL_VRAM0 && mem_type <= XE_PL_VRAM1)
+		return mem_type - XE_PL_VRAM0;
+
+	xe_assert(xe, mem_type >= XE_PL_VRAM0_PFMEM && mem_type <= XE_PL_VRAM1_PFMEM);
+	return mem_type - XE_PL_VRAM0_PFMEM;
+}
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
index 7661fca7f278..a25ec6c750da 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.c
+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
@@ -118,7 +118,10 @@ int xe_bo_evict_all_user(struct xe_device *xe)
 	u32 mem_type;
 	int ret;
 
-	/* User memory */
+	/*
+	 * Iterate over placements that can contain user memory. PF-mem placements
+	 * are excluded since they are reserved for pinned kernel BOs.
+	 */
 	for (mem_type = XE_PL_TT; mem_type <= XE_PL_VRAM1; ++mem_type) {
 		struct ttm_resource_manager *man =
 			ttm_manager_type(bdev, mem_type);
@@ -303,7 +306,7 @@ void xe_bo_pci_dev_remove_all(struct xe_device *xe)
 	 * Move pagemap bos and exported dma-buf to system, and
 	 * purge everything else.
 	 */
-	for (mem_type = XE_PL_VRAM1; mem_type >= XE_PL_TT; --mem_type) {
+	for (mem_type = XE_PL_VRAM1_PFMEM; mem_type >= XE_PL_TT; --mem_type) {
 		struct ttm_resource_manager *man =
 			ttm_manager_type(&xe->ttm, mem_type);
 
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index f517bf453b54..a4fe6a89d9dd 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -975,7 +975,7 @@ int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold)
 	u32 vram_total_mb = 0;
 	int i;
 
-	for (i = XE_PL_VRAM0; i <= XE_PL_VRAM1; ++i) {
+	xe_for_each_vram_pl(i) {
 		man = ttm_manager_type(&xe->ttm, i);
 		if (man)
 			vram_total_mb += DIV_ROUND_UP_ULL(man->size, 1024 * 1024);
@@ -1012,7 +1012,7 @@ void xe_pm_d3cold_allowed_toggle(struct xe_device *xe)
 		return;
 	}
 
-	for (i = XE_PL_VRAM0; i <= XE_PL_VRAM1; ++i) {
+	xe_for_each_vram_pl(i) {
 		man = ttm_manager_type(&xe->ttm, i);
 		if (man) {
 			vram_used = ttm_resource_manager_usage(man);
diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
index 0522caafd89d..4603a3356e53 100644
--- a/drivers/gpu/drm/xe/xe_res_cursor.h
+++ b/drivers/gpu/drm/xe/xe_res_cursor.h
@@ -111,7 +111,9 @@ static inline void xe_res_first(struct ttm_resource *res,
 		break;
 	}
 	case XE_PL_VRAM0:
-	case XE_PL_VRAM1: {
+	case XE_PL_VRAM1:
+	case XE_PL_VRAM0_PFMEM:
+	case XE_PL_VRAM1_PFMEM: {
 		struct gpu_buddy_block *block;
 		struct list_head *head, *next;
 		struct gpu_buddy *mm = xe_res_get_buddy(res);
@@ -303,6 +305,8 @@ static inline void xe_res_next(struct xe_res_cursor *cur, u64 size)
 		break;
 	case XE_PL_VRAM0:
 	case XE_PL_VRAM1:
+	case XE_PL_VRAM0_PFMEM:
+	case XE_PL_VRAM1_PFMEM: {
 		start = size - cur->size;
 		block = cur->node;
 
@@ -322,6 +326,7 @@ static inline void xe_res_next(struct xe_res_cursor *cur, u64 size)
 				cur->remaining);
 		cur->node = block;
 		break;
+	}
 	default:
 		return;
 	}
@@ -358,6 +363,8 @@ static inline bool xe_res_is_vram(const struct xe_res_cursor *cur)
 	case XE_PL_STOLEN:
 	case XE_PL_VRAM0:
 	case XE_PL_VRAM1:
+	case XE_PL_VRAM0_PFMEM:
+	case XE_PL_VRAM1_PFMEM:
 		return true;
 	default:
 		break;
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 05911904c1f9..bb28b493fd93 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -18,6 +18,7 @@
 #include "xe_pm.h"
 #include "xe_res_cursor.h"
 #include "xe_ttm_vram_mgr.h"
+#include "xe_vram.h"
 #include "xe_vram_types.h"
 
 static inline struct gpu_buddy_block *
@@ -336,7 +337,6 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 {
 	struct ttm_resource_manager *man = &mgr->manager;
 	struct dmem_cgroup_region *cg;
-	const char *name;
 	int err;
 
 	man->func = &xe_ttm_vram_mgr_func;
@@ -365,8 +365,7 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 	if (err)
 		return err;
 
-	name = mem_type == XE_PL_VRAM0 ? "vram0" : "vram1";
-	cg = drmm_cgroup_register_region(&xe->drm, name,
+	cg = drmm_cgroup_register_region(&xe->drm, xe_mem_type_to_name[mem_type],
 					 &(struct dmem_cgroup_init){
 						.size = size,
 						.ops = &xe_ttm_vram_mgr_dmem_ops,
@@ -405,7 +404,7 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
 			      enum dma_data_direction dir,
 			      struct sg_table **sgt)
 {
-	struct xe_tile *tile = &xe->tiles[res->mem_type - XE_PL_VRAM0];
+	struct xe_vram_region *vram = xe_map_resource_to_region(res);
 	struct xe_ttm_vram_mgr_resource *vres = to_xe_ttm_vram_mgr_resource(res);
 	struct xe_res_cursor cursor;
 	struct scatterlist *sg;
@@ -443,7 +442,7 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
 	 */
 	xe_res_first(res, offset, length, &cursor);
 	for_each_sgtable_sg((*sgt), sg, i) {
-		phys_addr_t phys = cursor.start + xe_vram_region_io_start(tile->mem.vram);
+		phys_addr_t phys = cursor.start + xe_vram_region_io_start(vram);
 		size_t size = min_t(u64, cursor.size, SZ_2G);
 		dma_addr_t addr;
 
-- 
2.34.1

