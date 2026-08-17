Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AB6C5DF70
	for <intel-xe@archiver.kernel.org>; Mon, 17 Aug 2026 09:10:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 260E710E6F4;
	Mon, 17 Aug 2026 09:10:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QVztSDUR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6341F10E6E6
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Aug 2026 09:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786957852; x=1818493852;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=uBZanRAxu351UZpeHGDhtUOBReQ6p9Ogo9W2uPWXJhw=;
 b=QVztSDUR45YfBwPN8RfUYm3YucQTriZjsC8OwbRrv1jRG2/qtjn1OAnn
 fNgHTMH3CzRfgqPldfiIU+HVWjrSZ8Ua5r47gYtXNLbNV9MvFkVvYlNUj
 3mUSt3r/PDT3VkYrGm2CLHdHN1vOzHIKCVZUUStAxDFUeqrUblVPLBBd+
 H+cdMzYOVRIJgEJeaeRtWZS538cfbxjIZ9e9vB181CRxhiUVMnBCHC/Vo
 4io9Xf1bGXF41IlkkWEpmoDTbzaOYQPrydxZ+RbrrRWmFXb0MiZcLXigQ
 3Ejl2sNKG6xl4ZDCv0pGU/teSdh6X/Ytvg2NNkUklQqGjOtZYa93/gdUb w==;
X-CSE-ConnectionGUID: 3DhoVeeLQIWWd0MhcCMPOA==
X-CSE-MsgGUID: gnAWFapzTtKmCMYG6+AIGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="91107254"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="91107254"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 02:10:41 -0700
X-CSE-ConnectionGUID: wJll0lZsSVemxKMlkZO4Jw==
X-CSE-MsgGUID: JC2tDDlqRFm9mFJnG+B8/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="294780317"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 02:10:41 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 17 Aug 2026 02:10:40 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 17 Aug 2026 02:10:40 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.37) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 17 Aug 2026 02:10:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zTManIaebEu7WdUUoHnPgRLIrepBEbJ7obJUlzm1V06nLWCDcAByhsFw6zX/nV0EO224Ruu/KscTVvarnVBpFBpXzwd6bg6SZ/hs/qI+KsS6BlJDzApckRV0NTYWVvMWwBg8+EmGvgS8d5uy1grPtAh1Ssz/SCgLfmdmj6HY+gpTBweJDBA5QSm1KeBx+ycEF/4GkJmYUYJLuHMpfMBTAssukjMRctaoC0IQpev11BMJrjWsTK2y5YEoFni+apZJ6l02lbsrP2p8Q66EM9C/XdiuUbr118IN9h1wZoY3tzjeDecGfDOe6itgHUyzksgMLv06EyPjx87kZv8igT6cMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xYypHyNTyvtoHYAuHCILr/EMq33YIKA/UxtI4I60rUM=;
 b=x1dP4vVXam0L74ptfHfobFU+1uObfMosO6cgGDKQC6tnBXh3Kb8X+4a+hwxnyQYOjV75OPfvAPrTBsZD37vTNnUMaNYdcavewQy16ynyj/mTf0rM7GXy1eE3V4IrnecoLiWYzmcqPDhPDBeak5gpqIIsDbeQQcRRkkJvg7tuPRASMVH1PZK0vhnfI8BIonwQT0ZcjxkY6A6ExqONnHnbNcwAsV9VGRAYEPGC9Szr6C1zmC6ThRs6oBlX/UuP2i/oFxjXvEwaGg0ZgP6lOhuH/JnuvAASsXypqaB5NuubP1307ZCRFqZcifXla5+Fzeyq+1gMGoojram1DSaAwBvAjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by LV8PR11MB8485.namprd11.prod.outlook.com (2603:10b6:408:1e6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 09:10:35 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 09:10:35 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: [PATCH v2 2/4] drm/xe/kunit: Extend GuC ID manager split-pool coverage
Date: Mon, 17 Aug 2026 11:10:11 +0200
Message-ID: <20260817091013.280173-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260817091013.280173-1-piotr.piorkowski@intel.com>
References: <20260817091013.280173-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0014.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::19) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|LV8PR11MB8485:EE_
X-MS-Office365-Filtering-Correlation-Id: 0673cc80-50b6-4323-62e8-08defc3f6589
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: KUUbp83Wh7XxCMcgDJ0q/nKj6ugVPKyTSEhH/xvTh+60M46/i79TxV8QoFyb7k1rR3Om1uMymr/8avzd1WGveXtG56135GIYTynNalp53MAM2+bEDdzRNBajXsF9hUK2EGItNiQigP1xvX/6qKvr4Re0NqHthylVb95mUmr2MRy4CirNBF6KMSWI/ifJ5F5yQT7NoFX5b1Kc6Up58uH5vmRFbtuTaMWZJNdfiDsse0KXOkBQWlvchrSmeya0WkaSibo7hqKtOvXLTGGlydmSse4SNnFjoKHrPTIPUPgNtG0Joqtd+hcOvhyMgDHOf+aJSrCNx3c3GwIdZLDQWQSmP1gfctWnb+A8w4/nkZynTYDl4rOZSx9rD2xWJ3zwzdNnAQPg+FGhhazeprJ4yi60JqoR5wS9yqjlp7JA+x3RLKeLFXst0CWWY9KO5TZ1uwgVCoDxq8O5TryF/GaYTXLvGScyXWhehzcaVkivjuHEmiiiHVl46WskLwZnej/YIY0U7eyw82IgXEAcJCF4o/jO8xMTwtWaXDwd4A4X22miqPBmFArVvymNLP8zMpuewBaH2yZ7dHyAb0VfwktmhzAyHmjFRKuVriN6LIyT6A5SIwRirv5F3NVq2y2/MN+kE62vJUK8rG7GkceLrFJd3FXNi0etNKNy2hKz4PB5eYL9B/Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWZWelc3MnRaYTFaQkpFbDZwK1pBZHdaN2hScnFzKzV0d2xTd0FLOFp5bGlr?=
 =?utf-8?B?dGtLVW5aTTR3blpwOHN1YXd2UHZnaWtvaUU4ZjlOSTRNWmVOVmhObDA3Vklq?=
 =?utf-8?B?QW1WeGs0dUpYV0FLcExlc3lyQWlSZENJdGtDNG9uaDlScS9RQkp0OGExdVY3?=
 =?utf-8?B?TTloRm9DL0R4My9zUSs2MURKVVp0MTg0ZDM4cWFjSnBYUm5kaW9Xc2tST2dn?=
 =?utf-8?B?UnJtbzMvdzB3dDFHYkNreHB5VzRaVFFOYkF4OWVNS283N1ZraUZvdEhjOTYr?=
 =?utf-8?B?NWdoTzZsQUMwSmtNQ2RuL3FCWHFLcFdiTHhYd1cwOEpUeGF5RjlpcU9heVZ4?=
 =?utf-8?B?NW1pTVdKY3NhUklHREpjeUxhSEhVdWJhWGNSSk1VVmpYNTRKVDFNSzlHUnk1?=
 =?utf-8?B?K3Budno3SUFxbXc1dFNUQnJndmZrNGxXTXpUTThLQU1hdVFzWlgwMGtHTU1Z?=
 =?utf-8?B?OVdVQUI5NzNET3pOUFEzc0tBc1o5YjNXUEZESEZKYzduRHprcDRzQ296OEVw?=
 =?utf-8?B?RHI5NG01M2VZNi9VRDNTajlvY0JZTHJzZWZSWEhsNjhqSjdKOHJMOGZPa1VR?=
 =?utf-8?B?cWkxWENwTm9GazlPeDJ1WExPNlJzZjg5dE5rUmc0bldPQ3NzRGZsOTc5aHl3?=
 =?utf-8?B?aWZYMG04dVc5Z1JkdnJQRE1OQ29Gb0l6UzZIL2VUd3ZJWEloSitMNU9UaGht?=
 =?utf-8?B?NUJsUzRwQnFKQzBvM3B0Yzl5ZVJZKzhVRmJzdmtnVmdKbjUwYlVWeGo1NGxQ?=
 =?utf-8?B?WVp1QTZjdkJUb0ltQW1FWWZrNUZ0dWNXaSsvaUp0eFUwZ1VwVnZWbDVlbzdZ?=
 =?utf-8?B?V0tjK0ZYQndnWUJ6SHZQV2FYcld0SmIvOEpXVWpwMEJYMzR4UXZsb2hoZGV6?=
 =?utf-8?B?V1NJQWlON0VxcXhNOVFFei95VU00cFhRUFFsU2RXVlZWeERKQm5pa2crZHVE?=
 =?utf-8?B?MjRoSDhUeVVOK2M2Wnl2TWgrZkk3MHlnblcwa0JxQWgraXlLOHVrVm85YzNY?=
 =?utf-8?B?aEZLOG9nWVpMNTVSMWpWUWI1dlcyY3FaZlN5RGlleEtXaXk2ZXp6YjV0UG1a?=
 =?utf-8?B?UkRSUUJDL1BIY21haW1FTFI1OC9OR0ZQeDlBQ09mYmU0MUNSRUlJK1JqYjBL?=
 =?utf-8?B?d0x0RGhZME1GRm5nV2xpNmovaytUVlAxYWllVnhBc3JTQmlqaHB4aFZjbnMx?=
 =?utf-8?B?MTkrWkdFamVhOEhKdk9Vb2QybGhObkZpNXhkMWNOenR0c3Y4ZzNsaEFRYUFh?=
 =?utf-8?B?VlBoc1NPcThQY3NTYVFoZE92OG1sOTJ0WmhNQlJEcTNBR251WWtLVnVkMjZS?=
 =?utf-8?B?Yk5uTE40V08randhOVZ2UHI3aThiRUJjSjBuYWdRYU1qbG1oWGlDNTVNelNz?=
 =?utf-8?B?SlhGeU1jSDd6V0NuRmhTVmtNZDZFVUp3bERHNU5rMjBub0JQenlsbVREczdr?=
 =?utf-8?B?YkczN0Rma01OWllyT2ZHQ2lSRFRRSlNuYzcrWUM1WXV2ck9COUd2NEpxYXJW?=
 =?utf-8?B?K0d6QzRVNWhGRHlzcTFiMExoU0hFaStDOFdDUWYvalRaOCtPYXBVMXkrK2E1?=
 =?utf-8?B?UjBSMlBNeW1KN2hnNHZ3emFDVVI4UytncFV1N0s2bWd5WHY0VEVIVmlmaU40?=
 =?utf-8?B?Y1RDYXV0VEtqeGQyaTFaZEMyendsMmFubUd4WENxT0ErQXZPTmRYTGUwTmNv?=
 =?utf-8?B?dGt3VHFPUlhjd0d6dkdEY0FMN0xpZzVlVTJtSlVHdEtjOEZ5WVdlQytRMjhT?=
 =?utf-8?B?N21EbnJ5ZTlPa2dhWWRvQmVVaXJHSUhUMzBNN21vdTZpNmprN1BGT1NYbllx?=
 =?utf-8?B?WW1Ia0RacFAyRXRvdTNtQVEwRGNMbVBkUk02REkvaytkTElKNnM1aDdvdm4x?=
 =?utf-8?B?YzIvRW1zK3ZUTEliaXZJYXNFS21EZE91QTJCZXJncjVYc1FncjFaalpwa3hC?=
 =?utf-8?B?TFB3MG5SdjVyUTZDcU5OYmlqdzBxQVB2NkhWcDQzcnlnNlhPSkRSUEZuY1Ry?=
 =?utf-8?B?ZUlxWWNoYm5FeTFxYmJXUjZqZmdiblVLM1VON0lPUENvN2xHRWRJRFZpM2ov?=
 =?utf-8?B?bHpqb2FTa25uTnFIaFRKYVZlaU9MWEhJVERJRmpPaUQ4VEZ2Z2pUN2Z5VzdP?=
 =?utf-8?B?TDRQb0lsVUh1VHBVdW5EdkpBSmZ1ZUxxSTh0OXM2R0I0cVZNbnhHcVJydk4x?=
 =?utf-8?B?b25COU4zWGxPZ1RWSGNXWjJkdTVsaGtIdVhQVHdEYzZUc0JBbnNjRG5TTVpm?=
 =?utf-8?B?dGpMNGRMRGRadS9tNHM3VHpGZkZDS3B4akFPK1E3eUltRjY4VDBydFRtNEtJ?=
 =?utf-8?B?bzBqRm9kZmo2dGgzSXZrNkdzU0x5OC9FUjdxNzJMcEV3TXBXcHlubHk0Y2JZ?=
 =?utf-8?Q?SK6K4NOIEoRMdEGc=3D?=
X-Exchange-RoutingPolicyChecked: fk9cAMM1/czxIwEEl4c4FodAuUK9N7OHHFl+dhSDqlnt2ICrpwi+LsceyzUzimEfb/e3d62cpIFe9Zl51iASMrsI9d6WyFE2fG+IkybsCRkMUVLQixlpd2EIdROOhOpJEdHjh7epgaKTyhA/960jIq2QRu8FyAelwWIBrKY1q2ACJ2yBVvjfO816zqTAfwSQ2iBE1ko/jwhXzxJ1H4uRpYUUX8IYvkYDNR7zQjEbpOaPd1knnsGgaq6QAYzWTd3WtUvX0b2uQ3TUL6IBEDHPXpEaVIbZh4w7yYWw7kgJhWqx/hbnsJyi2/ma+qfMgcxkINem42PzTuU/7pmwAbEXAQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0673cc80-50b6-4323-62e8-08defc3f6589
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 09:10:35.1468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4hpAhpDouv+Ueq+NTbrrvq7YNWgdn0c5gjiJtBMxmwBQybjmmGXcoEdoPJ84Pw9dW1OcOYXqDrlkKmMncfLs126q0KXDmlaKaA3cyfODdRY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8485
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

Expand the GuC ID manager KUnit coverage to exercise the new
usable/shareable pool model.

v2: Use KUNIT_EXPECT instead of KUNIT_ASSERT inside the locked section
    so the mutex is not leaked on failure (Sashiko).

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c | 383 ++++++++++++++++++
 1 file changed, 383 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
index 103ea82d278e..295c17dbc21f 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
@@ -119,12 +119,395 @@ static void check_all(struct kunit *test)
 	mutex_unlock(idm_mutex(idm));
 }
 
+static void check_limits(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 10, 20));
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_usable(idm), 10);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_shareable(idm), 20);
+	KUNIT_EXPECT_EQ(test, idm_total(idm), 30);
+}
+
+static void check_overlap(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, GUC_ID_MAX, GUC_ID_MAX));
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_usable(idm), GUC_ID_MAX);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_shareable(idm), GUC_ID_MAX);
+	KUNIT_EXPECT_EQ(test, idm_total(idm), GUC_ID_MAX);
+}
+
+static void check_overlap_alloc(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	unsigned int total;
+	int usable_id, shareable_id;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, GUC_ID_MAX, GUC_ID_MAX));
+
+	mutex_lock(idm_mutex(idm));
+	total = idm_total(idm);
+
+	usable_id = xe_guc_id_mgr_reserve_usable_locked(idm, 2);
+	KUNIT_EXPECT_EQ(test, usable_id, 0);
+
+	shareable_id = xe_guc_id_mgr_reserve_shareable_locked(idm, 3, 0);
+	KUNIT_EXPECT_EQ(test, shareable_id, total - 3);
+
+	KUNIT_EXPECT_EQ(test, idm_used_total(idm), 5);
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 5);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 5);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, usable_id, 2), 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_shareable_locked(idm, shareable_id, 3), 0);
+	KUNIT_EXPECT_EQ(test, idm_used_total(idm), 0);
+
+	mutex_unlock(idm_mutex(idm));
+}
+
+static void check_overlap_release(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	unsigned int total;
+	int id;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, GUC_ID_MAX, GUC_ID_MAX));
+
+	mutex_lock(idm_mutex(idm));
+	total = idm_total(idm);
+
+	id = xe_guc_id_mgr_reserve_usable_locked(idm, 4);
+	KUNIT_EXPECT_EQ(test, id, 0);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_shareable_locked(idm, id, 4), 0);
+	KUNIT_EXPECT_EQ(test, idm_used_total(idm), 0);
+
+	id = xe_guc_id_mgr_reserve_shareable_locked(idm, 4, 0);
+	KUNIT_EXPECT_EQ(test, id, total - 4);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, id, 4), 0);
+	KUNIT_EXPECT_EQ(test, idm_used_total(idm), 0);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, 0, 0), -EINVAL);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_shareable_locked(idm, 0, 0), -EINVAL);
+
+	mutex_unlock(idm_mutex(idm));
+}
+
+static void check_overlap_partial_init(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	unsigned int pools_size = (GUC_ID_MAX / 3) * 2;
+	unsigned int shareable_start;
+	unsigned int rest;
+	int id;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, pools_size, pools_size));
+
+	mutex_lock(idm_mutex(idm));
+
+	shareable_start = idm_shareable_start(idm);
+	rest = idm_total(idm) - pools_size;
+
+	KUNIT_EXPECT_EQ(test, idm_total(idm), GUC_ID_MAX);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_usable(idm), pools_size);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_shareable(idm), pools_size);
+	KUNIT_EXPECT_EQ(test, shareable_start, GUC_ID_MAX - pools_size);
+
+	id = xe_guc_id_mgr_reserve_usable_locked(idm, pools_size);
+	KUNIT_EXPECT_EQ(test, id, 0);
+
+	id = xe_guc_id_mgr_reserve_shareable_locked(idm, rest, 0);
+	KUNIT_EXPECT_EQ(test, id, pools_size);
+
+	KUNIT_EXPECT_EQ(test, idm_used_total(idm), GUC_ID_MAX);
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), pools_size);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), pools_size);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, 0, pools_size), 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_shareable_locked(idm, pools_size, rest), 0);
+	KUNIT_EXPECT_EQ(test, idm_used_total(idm), 0);
+
+	mutex_unlock(idm_mutex(idm));
+}
+
+static void check_overlap_partial_shared_range_blocking(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	unsigned int pools_size = (GUC_ID_MAX / 3) * 2;
+	int usable_id, shareable_range_id, shareable_overlap_id;
+	unsigned int shareable_start;
+	unsigned int nonoverlap_size;
+	unsigned int overlap_size;
+	unsigned int total;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, pools_size, pools_size));
+
+	mutex_lock(idm_mutex(idm));
+
+	total = idm_total(idm);
+	shareable_start = idm_shareable_start(idm);
+	nonoverlap_size = total - pools_size;
+	overlap_size = pools_size - shareable_start;
+
+	KUNIT_EXPECT_GT(test, nonoverlap_size, 0);
+	KUNIT_EXPECT_GT(test, overlap_size, 0);
+
+	shareable_range_id = xe_guc_id_mgr_reserve_shareable_locked(idm, nonoverlap_size, 0);
+	KUNIT_EXPECT_EQ(test, shareable_range_id, pools_size);
+
+	usable_id = xe_guc_id_mgr_reserve_usable_locked(idm, pools_size);
+	KUNIT_EXPECT_EQ(test, usable_id, 0);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_shareable_locked(idm, 1, 0), -ENOSPC);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, usable_id, pools_size), 0);
+
+	shareable_overlap_id = xe_guc_id_mgr_reserve_shareable_locked(idm, overlap_size, 0);
+	KUNIT_EXPECT_EQ(test, shareable_overlap_id, shareable_start);
+
+	usable_id = xe_guc_id_mgr_reserve_usable_locked(idm, shareable_start);
+	KUNIT_EXPECT_EQ(test, usable_id, 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable_locked(idm, 1), -ENOSPC);
+
+	KUNIT_EXPECT_EQ(test,
+			xe_guc_id_mgr_release_usable_locked(idm, usable_id, shareable_start),
+			0);
+	KUNIT_EXPECT_EQ(test,
+			xe_guc_id_mgr_release_shareable_locked(idm, shareable_overlap_id,
+							       overlap_size),
+			0);
+	KUNIT_EXPECT_EQ(test,
+			xe_guc_id_mgr_release_shareable_locked(idm, shareable_range_id,
+							       nonoverlap_size),
+			0);
+	KUNIT_EXPECT_EQ(test, idm_used_total(idm), 0);
+
+	mutex_unlock(idm_mutex(idm));
+}
+
+static void check_used_usable(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	int id;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 8, 8));
+
+	mutex_lock(idm_mutex(idm));
+
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 0);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 0);
+
+	id = xe_guc_id_mgr_reserve_usable_locked(idm, 2);
+	KUNIT_EXPECT_GE(test, id, 0);
+
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 2);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 0);
+	KUNIT_EXPECT_EQ(test, idm_used_total(idm), 2);
+
+	idm_release_chunk_locked(idm, id, 2);
+	KUNIT_EXPECT_EQ(test, idm_used_total(idm), 0);
+
+	mutex_unlock(idm_mutex(idm));
+}
+
+static void check_used_shareable(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	unsigned int shareable_start;
+	int id;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 8, 8));
+
+	mutex_lock(idm_mutex(idm));
+	shareable_start = idm_shareable_start(idm);
+
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 0);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 0);
+
+	id = xe_guc_id_mgr_reserve_shareable_locked(idm, 3, 0);
+	KUNIT_EXPECT_EQ(test, id, shareable_start);
+
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 0);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 3);
+	KUNIT_EXPECT_EQ(test, idm_used_total(idm), 3);
+
+	idm_release_chunk_locked(idm, id, 3);
+	KUNIT_EXPECT_EQ(test, idm_used_total(idm), 0);
+
+	mutex_unlock(idm_mutex(idm));
+}
+
+static void check_used_mixed(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	unsigned int shareable_start;
+	int usable_id, shareable_id;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 8, 8));
+
+	mutex_lock(idm_mutex(idm));
+	shareable_start = idm_shareable_start(idm);
+
+	usable_id = xe_guc_id_mgr_reserve_usable_locked(idm, 2);
+	KUNIT_EXPECT_EQ(test, usable_id, 0);
+
+	shareable_id = xe_guc_id_mgr_reserve_shareable_locked(idm, 3, 0);
+	KUNIT_EXPECT_EQ(test, shareable_id, shareable_start);
+
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 2);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 3);
+	KUNIT_EXPECT_EQ(test, idm_used_total(idm), 5);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, usable_id, 2), 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_shareable_locked(idm, shareable_id, 3), 0);
+	KUNIT_EXPECT_EQ(test, idm_used_total(idm), 0);
+
+	mutex_unlock(idm_mutex(idm));
+}
+
+static void check_release_usable_range(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	int id;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 8, 8));
+
+	mutex_lock(idm_mutex(idm));
+
+	id = xe_guc_id_mgr_reserve_usable_locked(idm, 4);
+	KUNIT_EXPECT_EQ(test, id, 0);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, 4, 7), -ERANGE);
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 4);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, 0, 0), -EINVAL);
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 4);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, id, 4), 0);
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 0);
+
+	mutex_unlock(idm_mutex(idm));
+}
+
+static void check_release_shareable_range(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	unsigned int shareable_start;
+	int id;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 8, 8));
+
+	mutex_lock(idm_mutex(idm));
+
+	shareable_start = idm_shareable_start(idm);
+	id = xe_guc_id_mgr_reserve_shareable_locked(idm, 4, 0);
+	KUNIT_EXPECT_EQ(test, id, shareable_start);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_shareable_locked(idm, 4, 7), -ERANGE);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 4);
+
+	KUNIT_EXPECT_EQ(test,
+			xe_guc_id_mgr_release_shareable_locked(idm, shareable_start, 0),
+			-EINVAL);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 4);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_shareable_locked(idm, id, 4), 0);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 0);
+
+	mutex_unlock(idm_mutex(idm));
+}
+
+static void check_split_boundaries(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	unsigned int shareable_start;
+	int id;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 4, 4));
+
+	mutex_lock(idm_mutex(idm));
+
+	shareable_start = idm_shareable_start(idm);
+
+	id = xe_guc_id_mgr_reserve_usable_locked(idm, 4);
+	KUNIT_EXPECT_EQ(test, id, 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable_locked(idm, 1), -ENOSPC);
+
+	id = xe_guc_id_mgr_reserve_shareable_locked(idm, 4, 0);
+	KUNIT_EXPECT_EQ(test, id, shareable_start);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_shareable_locked(idm, 1, 0), -ENOSPC);
+
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 4);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 4);
+
+	idm_release_chunk_locked(idm, 0, 4);
+	idm_release_chunk_locked(idm, shareable_start, 4);
+	KUNIT_EXPECT_EQ(test, idm_used_total(idm), 0);
+
+	mutex_unlock(idm_mutex(idm));
+}
+
+static void check_shareable_spare(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	unsigned int pools_size = (GUC_ID_MAX / 3) * 2;
+	unsigned int shareable_start;
+	unsigned int overlap_size;
+	unsigned int shared_tail;
+	int id_tail, id_overlap;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, pools_size, pools_size));
+
+	mutex_lock(idm_mutex(idm));
+	shareable_start = idm_shareable_start(idm);
+	overlap_size = idm->usable - shareable_start;
+	shared_tail = idm_total(idm) - idm->usable;
+
+	KUNIT_EXPECT_GT(test, overlap_size, 0);
+	KUNIT_EXPECT_GT(test, shared_tail, 0);
+
+	id_tail = xe_guc_id_mgr_reserve_shareable_locked(idm, shared_tail, 1);
+	KUNIT_EXPECT_EQ(test, id_tail, idm->usable);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), shared_tail);
+
+	id_overlap = xe_guc_id_mgr_reserve_shareable_locked(idm, overlap_size - 1, 1);
+	KUNIT_EXPECT_EQ(test, id_overlap, shareable_start + 1);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), idm->shareable - 1);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_shareable_locked(idm, 1, 1), -EDQUOT);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), idm->shareable - 1);
+
+	idm_release_chunk_locked(idm, id_tail, shared_tail);
+	idm_release_chunk_locked(idm, id_overlap, overlap_size - 1);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 0);
+
+	mutex_unlock(idm_mutex(idm));
+}
+
 static struct kunit_case guc_id_mgr_test_cases[] = {
 	KUNIT_CASE(bad_init),
 	KUNIT_CASE(no_init),
 	KUNIT_CASE(init_fini),
 	KUNIT_CASE(check_used),
 	KUNIT_CASE(check_quota),
+	KUNIT_CASE(check_limits),
+	KUNIT_CASE(check_overlap),
+	KUNIT_CASE(check_overlap_alloc),
+	KUNIT_CASE(check_overlap_release),
+	KUNIT_CASE(check_overlap_partial_init),
+	KUNIT_CASE(check_overlap_partial_shared_range_blocking),
+	KUNIT_CASE(check_used_usable),
+	KUNIT_CASE(check_used_shareable),
+	KUNIT_CASE(check_used_mixed),
+	KUNIT_CASE(check_release_usable_range),
+	KUNIT_CASE(check_release_shareable_range),
+	KUNIT_CASE(check_split_boundaries),
+	KUNIT_CASE(check_shareable_spare),
 	KUNIT_CASE_SLOW(check_all),
 	{}
 };
-- 
2.34.1

