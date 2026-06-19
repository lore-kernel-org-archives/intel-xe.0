Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0364ECD98F8
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jun 2026 19:12:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5F9310E101;
	Fri, 19 Jun 2026 19:12:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lUiYw9VQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F33B210E104
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jun 2026 19:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781896330; x=1813432330;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=TgKwrrpmmlNQ87KG2TJyezA5qBvTh2FvlVI0dhXBQ64=;
 b=lUiYw9VQ8aeN4G7HehIIc+b18TT7W9LmnhWs+4lerSSuOwM7RkgGkecJ
 dDEPh8Hb+r6lO6MDt1keOagYgdCn8scQ6tKoeu6u0bYm/VBOXLIG28zwM
 gTBZEnStHHMG8ErQo59jm/sbB1bG3+vIPbFFvOvkfEegTuddXSiRurNBY
 wMqxtQV9YNYNZWgNel4s7kbW4Ug9OzPH0fniiWuMWqjGgh8zPULGMv0gb
 0qcBJ+JneImABXhbW/q8GiBdJEG6es6SjOpM/uHjDBvOJ1ySluN28g8FM
 Mv5A2Y7KkA6uKlQp6i6ZVAs0nAqww+Mz0t8t3yHs+yeWdxXsyN6c3Mcwe Q==;
X-CSE-ConnectionGUID: pgODle/NTSKny0+ajpwHXQ==
X-CSE-MsgGUID: 6Mtel3SDQkKiKCFxDYbU9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11822"; a="86654413"
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="86654413"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 12:12:09 -0700
X-CSE-ConnectionGUID: SHmFxx0HRMCwnMfo2iaYYg==
X-CSE-MsgGUID: 7Ex0WP6JSbe2oTh+DSlQPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="278870293"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 12:12:10 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 12:12:09 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 19 Jun 2026 12:12:09 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.22)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 12:12:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iile3AYd/DDDtXda+EQt3xBkjQicYCOxYQOsPLf23JcEAqHXlVRYQVaUKVMfkZ6++ElpyW1tY/ZId9CK0tiWwpd/jQYOIw2oHlyneDOU8RuPx8N+e3cAfYAg0N3/JO47mRH/zxWSdpPraXiOb/+ynugm2b75kjjZ0u7ct+rjFopMFBdx4iYspv/9xmEt8gBOlzLZf26+OzZkTHQ58wK6nLawnVfzbanFVIdapFhWaingOwTrSHcTlL/a9L0WM9mfT8YxJ55+aOt2ha2lZu8Ku1gk1SGSNFxbS/i6v+/dVEvhKpdkynoP7dJqknUEVCmGe3xKCALDWtT+zuYohUeF/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uXfa2oEwY4x8Wajrhigq481MdmWeEf3NwtKCEZgL+VU=;
 b=ABsIwUnS/OiHhHoWN1u2SNljsmDv6k6oQHMv/a7WPpSIrWnRLNg8T4Xt3BGdi7mzsQWcqJ8uYSzkaOYIsJ4zgqlfsJrLm8HiiSOROgC/Prvqtbbk1veJEwSWnvIZW59HQ8sUF63irBxTyHOk8am2UfgTJiZxbL0QnAK2lxiHEm1teqTef++2caumrRdM9xXGr+pKKTZaAsmzdLbBfL+ZXwDVm+6R3Y7+hdEjSwFf2ZcUR90zPxBrn8QgM7aezdRXbFTwNUfuvAlhe32UUL+3g2mJlyM5VvHcZDBC1n6EgOMyeCpwyxHhXcgdpCgV+4arOnRyYxVMTqyz++sz0/4O4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by SJ0PR11MB5867.namprd11.prod.outlook.com (2603:10b6:a03:42a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Fri, 19 Jun
 2026 19:11:58 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%6]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 19:11:58 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: [PATCH v1 3/7] drm/xe/guc: Decouple the GuC ID manager from the
 submission state
Date: Fri, 19 Jun 2026 21:11:03 +0200
Message-ID: <20260619191107.2628783-4-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260619191107.2628783-1-piotr.piorkowski@intel.com>
References: <20260619191107.2628783-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB8PR04CA0002.eurprd04.prod.outlook.com
 (2603:10a6:10:110::12) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|SJ0PR11MB5867:EE_
X-MS-Office365-Filtering-Correlation-Id: 5957a862-83d3-4976-f583-08dece36a2a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Ym+6WL2PsZPoAQdEEitddql3M0OugBoKnJ9ZNGj1d19EYNn0oCADJ3YiLvYnCMfqoc+pN1NRDstkFbO/jvn1KgjdbfUne6Ffmo8NjBuv0tGOiXi+LuwluwYNNfXH6EJWmGdoxbTYgVFJGhjSN8JLSPpPlaN0pZnSjvyuavB85PK6EM5OAShRnn+M8De+Q7Z07RntmVyG6yX9lkzI/KOxoWUHK31YJAUYk7SBj4afNowpbkaYA8iJy7UWsjsx9Ts1du6t67IyKewvR3SxCxlpOpO1pUU2t0Tze28hgUeJnu5Y7UdTB9bBf4qScV4QLuYXeKsZTLB/ob213s71qXx/BMWQwM/+i1nBk/uUPc/CEsCbpHniPnVrYlafKBYPXGGvNx3G37gt+V2fFF+YBCEYSfM5SEi25fjD0szO9KmB8ERE8LOyKyIXY61wZ52Y1uN1Z8o4EE82LA156dczYMVk7FXE5Y/dsQGvT43JzUyXVP4qEq5r6hCIky1liIph3BzcvATsGZBsnZhovhmULyKjMDM/NJxmSnDMkazaOnSctjc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0dRbU1DUlJTRFgvZjVYSnJxUDdSbHQ2dG0wUUxKWE43TFNCYzNmQTRGcWY3?=
 =?utf-8?B?SnlINkc5TGN2NXJPR1MvbTM1cHM0U1ExQ2V3WkxZM2FNR0NmZ2I4R1V4QTAx?=
 =?utf-8?B?b0lwWVo4V05tendQVHNORjRlVTFxZU5TZVl1bTRvdlprTUlJdWZFUG1JdlVV?=
 =?utf-8?B?ZkNzSmU3aXhmL2ZlY1p4REJURTJqTFVFQ0luZ1RhZ2Y2bGdzY2tqMjJVTEsw?=
 =?utf-8?B?RHg1eURMY2E3elpyWFQrdmJld2owTWlGUGlPTUQ0OTJVaFdJaTY1UUhYWlhm?=
 =?utf-8?B?SFVoS2hNZEN6UnVXUlpSMXlMSTNZS2dLb0d1T3lTQ0grSVY1Q2lUR29VTGVM?=
 =?utf-8?B?WlEwazRQZWUrcmpqNVhHYXBHRS9QcmpWNGNqVm1lRFExYmF0K1F5K3BHYWlE?=
 =?utf-8?B?M1lmS3QwK2tSSDFkYnU1OU9jQ2JWSXB3aGdIbUNaYW5pQUhrV0FldUNuWVFj?=
 =?utf-8?B?NGlHNFUyd3BORElsa2lLR0x2bW8rZEJOemJrSDkyWTFKSkJ0TmVmeXhWbUY4?=
 =?utf-8?B?UGJNWHRwZVZkdW91ci9McjFMclg0TkdpRXlUNmhNN09FV3FFWHBKd0tvMVRn?=
 =?utf-8?B?N3VuTU9GRUsyR0dERG9oa0NoODU4d3hLay9EbVBBbEsweFJ3YTB4VjlsclpS?=
 =?utf-8?B?UnlYUXV0ejdiOEEyZys2SExheDBtbGNZU0wvUFNvU1VIaDczdzdDamkzRzc5?=
 =?utf-8?B?R1FoWSs5a3N0bHFwZDkwZlVydkY2SmxSTDAwVVF6MlpqUGVwQ01UUjFSMDNY?=
 =?utf-8?B?cVM3Yk5FUzdScnRwU0dEMFk0ZW1XZ1hZbzlKeGdpdHJIOEZsVTRXWGZ2Ui9B?=
 =?utf-8?B?bDFHdHBPcm9Sdm1ReS9qZk12TExhV3J4azJteHNnMGp4Zi9VNncwWFNpM2Uz?=
 =?utf-8?B?eTEvamdmS1d3Y25jZGJOY2x4VlZPZ0ZTVVlPYThyaWVJVnRRZ0QvemYvd0pL?=
 =?utf-8?B?N3pJM0xmUkc5eDdEM3cyVWlPZU9iSjcySFkzVEJJcUxKalcwUHFvbUNhTWJF?=
 =?utf-8?B?Nld0TDZMek9XN0ttWDNESnhWbUsrRG1qdFhaa0x1M25zUmhaT0RUME80dENs?=
 =?utf-8?B?STFrQnJUaUJLckNpQlJ4bFFjcWxHWml6RGJBdGR0VzR6VTQxb2hLeHp4TnRj?=
 =?utf-8?B?NkR6M3FvSC9XdXVxbWFtRnI4MVhlTVJPeVM3T3Z3eHNNMnB3VHBaVG9nM3RU?=
 =?utf-8?B?Mk9yUURMOENLNjc5Y3YzV3ZQZEZNNmxKSW9scXoycHNKanBuQTBEVVh4bWJI?=
 =?utf-8?B?YmpHcUs4T0Z1eE1sajBGclpaRTMvbjZhc2U3dmUxNHdHaUxFV094RFhlbm1v?=
 =?utf-8?B?WGMvbVhibVlsdUxXTFNHbzIvcktJNmt2b2NOb3NkOS9Ua3VjTXpjS2xLUjRH?=
 =?utf-8?B?d05XSUdwcXE3Q3dMMXdYWURvRWpWNVBsZDk1ZUc0YURPcVhYTnI0VHE5WWRa?=
 =?utf-8?B?WDU2endXTVlJSUNQdDFjaVgxUU9Gd0xZMktPaUprWkx1NXlYYU0xbUpPZUov?=
 =?utf-8?B?cWFoOWtTa2t6bGk3RE5kVmRRMy9EME9iUUc1VjNFY1BUajVDYmFGUXIrdzZv?=
 =?utf-8?B?dkw2TkRFN2pxQ2s4ZGNOeWJZaXJZaXJSWnlSMGZIM1FwYUR4K0NCcWVLMUhO?=
 =?utf-8?B?a1pwYXZMZWxMMlV5Ti9XYXNFUFg4QVhTd0d2Z0g5dU9VN2EzSGRvMXFqTnA0?=
 =?utf-8?B?UTY0cDNwZ0dsZnRXRWZCdmRGM0RRVUZrM21iNGw2ZnRIclVMaGdlS2V5eDQy?=
 =?utf-8?B?eXR3VUtEZGxYUCtHNnhGZnVHQVJSLzdIK2N1UENiVnM4SlFqRHBpdkowUTVy?=
 =?utf-8?B?empWb0JNWDI0ODNCMXpZREYrVmsybG1yamVLbW11VmpORTVVSk9wN21QRWI1?=
 =?utf-8?B?OFN4RGp0V1lXdlhGRlZGR3FuZG4rS09IMi9uRzUybGhnUUxweEFpaFVwSEl0?=
 =?utf-8?B?R09kbktmVGFXVE1LSDdzdW9SUnNKSi9qY2lTaTRMdWh2Q1ZCVFNrTG1SWmw1?=
 =?utf-8?B?Q1BlOXJFbGwrTjFpR1ROVFpXSlBPRmFNZUNxZVowZXBoamlSTlZPd0RYY2Ev?=
 =?utf-8?B?aTN0anREUU12VmExOE8rbzVzMXl4eDhhdlU2NjRQZGFiNTdYTnoxdG5OY09P?=
 =?utf-8?B?TThTbFdoUGxjcFdyWGdaUzd1U1dOSndVNTNOMnhyV2R4QlhVaUZFVC9HbjFS?=
 =?utf-8?B?alFWVzdKTjlibzRSQmJjY2pkb0ZObGNpVE1xam5LOEw2ZVIwUHFzdk9aRUk2?=
 =?utf-8?B?TWxDc3NKcWZlNGtkUVlBTG1BbmFDVG1aeEFxTm84VG1PVVZkZTlCbkdmTk0y?=
 =?utf-8?B?Ujh3RXdSU1J4eVpDeUwzQ3RpRXhtWjZwRE9pNkJaZ0dPZWpVcDVmQ1hBbjB4?=
 =?utf-8?Q?znWYYdAEKCtrnaH8=3D?=
X-Exchange-RoutingPolicyChecked: bfNPSg5ID4OnguDeTpiBC6uwclduoSH2kePvy8NNKOkMgSTTLEWbu4zSAjD1nsvK/PmAo43JqPpJ+yMiMiw6FtWzSe1zYt3SRTWiTGncz64o6zWBQTV4Hlwbtnh3oo15BqMSLhQePt0DanJk02eL7pwaegO5Oq/9/yTT3sH3h4EHNrOeZMq4GL1MqRu+WjSsW2K0TJY9MzfCAdskcRFye2n3JnQaqQq/4I0vJK+8ITzgSnvkj3bD+qMvj4nOlzz5mGx9atnnMvKYtiG97uLOGN0dTgBMeADjcHRy4sxA87NAdiZMtJtUo/YQ95pFvQUeUyBAOyWuxX1CjQixUFNDIw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5957a862-83d3-4976-f583-08dece36a2a6
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 19:11:58.6852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iDriQAflna3NIsgK3nkh0Uiwomj0QikIAYmU/7J9TW1N+S8z9hUz13lRsaBXHzNIbJYKLeB7gUgCgQUQf9rFi0e4GbqzoXItTA5WrcTvT8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5867
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

Refactor the GuC context ID manager to remove its dependency
on guc->submission_state.
This allows using the ID manager outside of the GuC submission path as
a standalone resource pool, which is needed for future patches where
it will be used as a separate pool of context IDs for SR-IOV VFs
provisioning.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c | 22 +++++++++++++------
 drivers/gpu/drm/xe/xe_guc_id_mgr.c            | 18 ++++++++++++---
 drivers/gpu/drm/xe/xe_guc_id_mgr.h            |  5 ++++-
 drivers/gpu/drm/xe/xe_guc_submit.c            |  3 ++-
 drivers/gpu/drm/xe/xe_guc_types.h             | 21 ++++++++++++++++--
 5 files changed, 55 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
index ee30a1939eb0..4e4b1c890000 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
@@ -15,23 +15,31 @@ static int guc_id_mgr_test_init(struct kunit *test)
 	xe_kunit_helper_xe_device_test_init(test);
 	idm = &xe_device_get_gt(test->priv, 0)->uc.guc.submission_state.idm;
 
-	mutex_init(idm_mutex(idm));
 	test->priv = idm;
 	return 0;
 }
 
+static struct xe_guc *test_idm_to_guc(struct xe_guc_id_mgr *idm)
+{
+	return container_of(idm, struct xe_guc, submission_state.idm);
+}
+
 static void bad_init(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm = test->priv;
 
-	KUNIT_EXPECT_EQ(test, -EINVAL, xe_guc_id_mgr_init(idm, 0));
-	KUNIT_EXPECT_EQ(test, -ERANGE, xe_guc_id_mgr_init(idm, GUC_ID_MAX + 1));
+	KUNIT_EXPECT_EQ(test, -EINVAL, xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, 0));
+	KUNIT_EXPECT_EQ(test, -ERANGE,
+			xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, GUC_ID_MAX + 1));
 }
 
 static void no_init(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm = test->priv;
 
+	mutex_init(&idm->internal_lock);
+	idm->lock = &idm->internal_lock;
+
 	mutex_lock(idm_mutex(idm));
 	KUNIT_EXPECT_EQ(test, -ENODATA, xe_guc_id_mgr_reserve_locked(idm, 0));
 	mutex_unlock(idm_mutex(idm));
@@ -43,7 +51,7 @@ static void init_fini(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm = test->priv;
 
-	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, -1));
+	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, -1));
 	KUNIT_EXPECT_NOT_NULL(test, idm->bitmap);
 	KUNIT_EXPECT_EQ(test, idm->total, GUC_ID_MAX);
 	__fini_idm(NULL, idm);
@@ -56,7 +64,7 @@ static void check_used(struct kunit *test)
 	struct xe_guc_id_mgr *idm = test->priv;
 	unsigned int n;
 
-	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, 2));
+	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, 2));
 
 	mutex_lock(idm_mutex(idm));
 
@@ -78,7 +86,7 @@ static void check_quota(struct kunit *test)
 	struct xe_guc_id_mgr *idm = test->priv;
 	unsigned int n;
 
-	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, 2));
+	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, 2));
 
 	mutex_lock(idm_mutex(idm));
 
@@ -102,7 +110,7 @@ static void check_all(struct kunit *test)
 	struct xe_guc_id_mgr *idm = test->priv;
 	unsigned int n;
 
-	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, -1));
+	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, -1));
 
 	mutex_lock(idm_mutex(idm));
 
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
index 0738fc277bd2..f1e69650fb7e 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.c
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
@@ -16,7 +16,7 @@
 
 static struct xe_guc *idm_to_guc(struct xe_guc_id_mgr *idm)
 {
-	return container_of(idm, struct xe_guc, submission_state.idm);
+	return idm->guc;
 }
 
 static struct xe_gt *idm_to_gt(struct xe_guc_id_mgr *idm)
@@ -30,7 +30,7 @@ static struct xe_device *idm_to_xe(struct xe_guc_id_mgr *idm)
 }
 
 #define idm_assert(idm, cond)		xe_gt_assert(idm_to_gt(idm), cond)
-#define idm_mutex(idm)			(&idm_to_guc(idm)->submission_state.lock)
+#define idm_mutex(idm)			((idm)->lock)
 
 static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent);
 
@@ -63,6 +63,8 @@ static void __fini_idm(struct drm_device *drm, void *arg)
 /**
  * xe_guc_id_mgr_init() - Initialize GuC context ID Manager.
  * @idm: the &xe_guc_id_mgr to initialize
+ * @guc: the owning &xe_guc
+ * @lock: mutex protecting this manager, or NULL to use an internal lock
  * @limit: number of IDs to manage
  *
  * The bare-metal or PF driver can pass ~0 as &limit to indicate that all
@@ -73,10 +75,20 @@ static void __fini_idm(struct drm_device *drm, void *arg)
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit)
+int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, struct xe_guc *guc,
+		       struct mutex *lock, unsigned int limit)
 {
 	int ret;
 
+	idm->guc = guc;
+
+	if (!lock) {
+		mutex_init(&idm->internal_lock);
+		idm->lock = &idm->internal_lock;
+	} else {
+		idm->lock = lock;
+	}
+
 	idm_assert(idm, !idm->bitmap);
 	idm_assert(idm, !idm->total);
 	idm_assert(idm, !idm->used);
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.h b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
index 25c6f026449a..d0ce8ce85b7a 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.h
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
@@ -7,9 +7,12 @@
 #define _XE_GUC_ID_MGR_H_
 
 struct drm_printer;
+struct mutex;
+struct xe_guc;
 struct xe_guc_id_mgr;
 
-int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int count);
+int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, struct xe_guc *guc,
+		       struct mutex *lock, unsigned int count);
 
 unsigned int xe_guc_id_mgr_total(struct xe_guc_id_mgr *idm);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 537985f4d3b7..154d6129ea44 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -311,7 +311,8 @@ int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
 	if (err)
 		return err;
 
-	err = xe_guc_id_mgr_init(&guc->submission_state.idm, num_ids);
+	err = xe_guc_id_mgr_init(&guc->submission_state.idm, guc,
+				 &guc->submission_state.lock, num_ids);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
index c7b9642b41ba..0850918c28b0 100644
--- a/drivers/gpu/drm/xe/xe_guc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_types.h
@@ -7,6 +7,7 @@
 #define _XE_GUC_TYPES_H_
 
 #include <linux/idr.h>
+#include <linux/mutex.h>
 #include <linux/xarray.h>
 
 #include "regs/xe_reg_defs.h"
@@ -33,11 +34,14 @@ struct xe_guc_db_mgr {
 	unsigned long *bitmap;
 };
 
+struct xe_guc;
+
 /**
  * struct xe_guc_id_mgr - GuC context ID Manager.
  *
- * Note: GuC context ID Manager is relying on &xe_guc::submission_state.lock
- * to protect its members.
+ * Note: GuC context ID Manager uses the lock supplied at init time to
+ * protect its members. If no lock is supplied (NULL), an internal lock
+ * is initialized and used.
  */
 struct xe_guc_id_mgr {
 	/** @bitmap: bitmap to track allocated IDs */
@@ -46,6 +50,19 @@ struct xe_guc_id_mgr {
 	unsigned int total;
 	/** @used: number of IDs currently in use */
 	unsigned int used;
+	/** @guc: back-pointer to the owning &xe_guc, set at init time */
+	struct xe_guc *guc;
+	/**
+	 * @internal_lock: own mutex, used when no external lock is provided at init.
+	 * Do not use directly; always access through @lock.
+	 */
+	struct mutex internal_lock;
+	/**
+	 * @lock: active mutex protecting this manager.
+	 * Points to @internal_lock when initialized without an external lock,
+	 * or to the caller-supplied mutex otherwise.
+	 */
+	struct mutex *lock;
 };
 
 /**
-- 
2.34.1

