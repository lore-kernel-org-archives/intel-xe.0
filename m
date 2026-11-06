Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28164606A326
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 11:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Sxfu8FIK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3FCC112D10;
	Fri,  6 Nov 2026 11:06:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B06D3112D10
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 11:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793963208; x=1825499208;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=YMEsCPSzAQ5l6sug5CHDDx1cwSgMJ5vFBDdxKvEF64Q=;
 b=Sxfu8FIKJ6rbxKruv+PjK98oeYGxY9ckINvdv2VTGH+JqlC5/5019v4Q
 rP2XLO1PzNIZGtbBpRCwpvvSg6rsfZkID+OaA/zXug9jtnqHiTzDz8cBX
 7v/103o0N6CMLLZFwenSKJ55evOJR20dVitIBb3LwYI0OmDgiuVBAo7Qg
 xhvbJMV+zjaQHIjJOQVKw3xOAX/t4dMsWq9XyW3JpeILONhIp87AKHUHX
 mq8a3CzK9Uu8V8ba0BxrMeJ8z1OwKc+nhUWL6939rnBlCJOifcj8/cbz6
 WfwIsj5r1wEMBHZiYuiSN83wI5IXA79vh7b7PwtH+6cwcY1TAZmxg4QPk g==;
X-CSE-ConnectionGUID: rUY7GmS1T9CyXMuIRoQlrw==
X-CSE-MsgGUID: ms/kBmqYShGzufJzllUJ+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2775405"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2775405"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 03:06:47 -0800
X-CSE-ConnectionGUID: zbirAhyiTK++7A0oO3lelQ==
X-CSE-MsgGUID: QL/FsE8cS4KPxV2BiJDeDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7677304"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 03:06:47 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 6 Nov 2026 03:06:46 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 6 Nov 2026 03:06:46 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.64) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 6 Nov 2026 03:06:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hFjA2W/Jt0BJXEpXWdfcgg2PhbffTK+3THEWRnYUlymjiiLjjHCS0r6BDGMV/OupzaAEX4BXFn5DC19JuVR+7vEnog9mmj8CA11CzMuvAjMvgq/jOF08vgEWC/1+3d0IUreOCztMvwlCHHO3dhUSc6udjkXx/at0XTRgZA2wDla2Vp1Zd1k/7cH/plMPYatcquedt3OP9Vq8gWG69eBg4qf8za5Eaebu/53pMMuozjMEm8nxEoalcHJ8gWTqI1N5NIao1sGfQ2e8ZkE1nH9fQZxDiMywuw0rUXomWz3o/fALwY74Y9FgJGv6U0mZWMkYvlujXhZxhOtN4UEw4fR0hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uZneRRrxha1GO2GzCzhaAqq62jd8l6K4ocAwHidwptk=;
 b=fxhvhYirSsB941NF0bgjddgsW+4QiMAowQm0yHsi372/kOGRd3Yahu8l47dKxSgf8h173AKlGzZh6ndNM8xUoOT7f7qwBuxTx8jJFsdxS7ElIQAmFrINBKJZt2wqhEZc6bAbHckxf7XmaUyPm53jYAfVZ4/t4v4deXW/fYElttJikM0DB9nMk2JfzNg3DdhYn9cwyhfFVYCD5JX0dNOsLiI6nK6azHE9qUi4c+FzklYVCtavh2eYuL162P8DPkho8Bw+33YJVS7G3rQR+ls5nbP+vB8LicwCZhPwSyt3jFHgthSVodSFXYXiHg6eCwNjEnniPRtTTEMFOyWAILCBzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by PH3PPF1AF044E07.namprd11.prod.outlook.com (2603:10b6:518:1::d0c)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 11:06:44 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%3]) with mapi id 15.21.0592.007; Fri, 6 Nov 2026
 11:06:44 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v1] drm/xe/guc: Reset TLB invalidation state in submit fini
Date: Fri, 6 Nov 2026 12:06:20 +0100
Message-ID: <20261106110620.2065903-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0295.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::11) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|PH3PPF1AF044E07:EE_
X-MS-Office365-Filtering-Correlation-Id: 937b4ac3-cd05-4271-ef83-08df3bf60af7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|261102123227099003|261009223027099003|261021121427099003|261022105027099003|261026121527099003|261026140227099003|261028144727099003|11063799006|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: SrNfRIlr6HgqCmNCA6zFjEpgUx8mVCHZ0Lvtp7Z++XLhWgicd6A1B1iq181BLMoCU0pF6yckrecNPZ3fC01A18jRIKEJ0kyfeVWIBd2DC4vRCYW6GIWWHhXkMKwHuQBeeP3wmX2CeN5oaegnotgXpfHphDShkulY2MtnDLQJsf044reZhLXMW6xQd1GfsIToXfqKPPjdBtV73g/Vn9ve7hX5ByYEL02eg8+20wa4gheQZCdY++GmXlpdaIp6X9vnZwjfwD9y7UyPTRcVAIpty+cFHV8978UAjZH93fLnIC0XHLqHPSFn5TpsGggQScemvuRhvJTcIpHj+MLYNVdmidontYD01nEocfSMW5w6RwxkR1sxJgOrWxtSl0BPovkNCUvQqiQkNmMwCnkqYFRevKA6hE0s0E2Q8sMVKVTVX+YLquj4r7YrSJ73TXElvAdLvcs6sMuz0TeD4hbD5dRdZgpchP94EKydm/tGIUJ/7DzqLEAjUfH7YxiZeEe78IzFejQK/Hf3YX5ech62fp47q7yvod1GZ9pb04VTNDI3Ih8KpG0jRDsIbdVDvz5UP6nnMSP+yxCJWBm/WP7dC8MAeHrghKFVUN+XalUr0WvMGNQ69WMXOr8uAnbaLQZXd40pZPcgVxp0UOd0qKc01OOiY3qWQpm4RUlbTBqdlE2TBNY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261102123227099003)(261009223027099003)(261021121427099003)(261022105027099003)(261026121527099003)(261026140227099003)(261028144727099003)(11063799006)(56012099006)(10067099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1ZjVlUxVTA5dENaYUk5RkdSRDEzUDRvcnk3dUFaak9YSHRIM0JoSlJVd0pI?=
 =?utf-8?B?dnVoVDlKYzF6YW5PZzFmM2ROdjRWY1BKSTFERmxUQ1ZFdzRXVWw3NStBbEdv?=
 =?utf-8?B?cFFOK1doVFpxQXVsdWJXNzJVMUdQZEhLSHpoem9iaUd6SGlVQXBjaEdCanhH?=
 =?utf-8?B?ZFlxa2pIUVRxaGczay8xNWJmTGZoVkNnL3dlOXczMFJ5WFRYWWdoMHNFZ0J4?=
 =?utf-8?B?Y2Z5RUJlVTRYd0ZpTlQyRm5sVVdCMkpGc3UzL0ZWSEFYVjUxdzVNWGdycUlK?=
 =?utf-8?B?V1J5MHJJQjFOVjJCT255cS9xM055UDVPVjZyL0tvcEdxMGhSeG1kZnVCL3Na?=
 =?utf-8?B?QVZPVXNiRGRLNDROQzZLczJyTlVNMmFaSHlKWUZnR00xNVhFVWxUQXNUYVE3?=
 =?utf-8?B?ZTc3TXVsbGsveXpOUzJlSlphMkZvdzgycmU2aWlzSkpXcnhVU0czMGc1c0pM?=
 =?utf-8?B?MERYeEY5NFZMTlhVNHdkTDF5REhwcmRQcG45M3M5ZjY5VHJ2d1lBdktkRDBG?=
 =?utf-8?B?V29jR1VOc3RnSWZGdmNhRmltOW5icFRvK3d4ekYvY3Mzcjd0Nmd5RmZTb2U0?=
 =?utf-8?B?Q3hGVVdNcUlHd1JIbHRPQ3NKWllrUjB4a3pYeGYzRk5DWUljOTlMcXlkM0sr?=
 =?utf-8?B?QXAxUVJlb3M2anNEUUN5VWxpUkVwaVNKOHVNSUkyM2w1bzZFUXR2STk1L1ZW?=
 =?utf-8?B?dHZFaFI2eGFSV1htOXNYVi9GSG0wOXk1bUcwODArVXpPWXYzcHBwVkF5WFVq?=
 =?utf-8?B?RHgrd2pWZGxFeUxvdjdZdkdOMmRhVzJoNjZiamRtU1FveE5rQzJzS3pxNlJi?=
 =?utf-8?B?V0cweW5rRURWOUZlQmlkY3FLeCt2TmVlNzVsVVgzWVhLZW1rUmYrTFlxMG80?=
 =?utf-8?B?SmRJTHdSb0Y3aVpDNWEvbmJBVXYwYXNRMy9sU0hsMGY3RnN0WWZGOUNzeERm?=
 =?utf-8?B?NEk0OXBKb3F1MkQxNnZTdEdCZnRkak8rdGRnQjNlMWR0V0RJVVRadmR5ZDQ1?=
 =?utf-8?B?Z3VZZHpmVDZMNFVBMUNWMFBXSk43WVR0TTBsTTVTaURyL29LM1o0S1pFMFA3?=
 =?utf-8?B?amhFWUsvVEVXN1YzNTJyQlh4d2krWWdlOThJRUZ4em9Wc0lJL1hTQjJHdG9J?=
 =?utf-8?B?ZkE0WlhGQVNGNmNNYklvdzJjT0JiMEV6L2huQVVON3pvTVh3UloxOFRhdzhp?=
 =?utf-8?B?Nm9uYkI0cU9JaHRib0toSEdWWTRyVmRBNjVhN2pySWlvTU5aRDRtM3hjSzVO?=
 =?utf-8?B?Z3p2NUZzSUkrTmNQOGtnSGVMdnZJMHVTWVhVZjAyVTZyS0hwVkFaV21MU0Q5?=
 =?utf-8?B?ck5nN2d0UXMvd1UyT1dGcE5TejRTZzZIYmdZc2svQjJERExDSjlkWXd1TlRR?=
 =?utf-8?B?RDZxVVFPRkVDUEI1a1dac1J3c2czVWNsNTZsSkg2YURvTTY2VXR5Y0lTTm9y?=
 =?utf-8?B?eGNIK09aYTFXK2xvRkxiNWRnS3o5YSt2UXJKb3FUeGpTV21ZOERXL0RqejYr?=
 =?utf-8?B?NzU2ZDBOeWlOMHFDUmQvSlhkTHRnelNvRGRVbmRZS3NtVysxemZhYXcvRlZU?=
 =?utf-8?B?TnpIRG5BMUxXbVhweUxEaEJVWWxxbWtQVldBMHFoTGxYeG1iTzFtbldZdm1a?=
 =?utf-8?B?TG51WTZ2UzlHaVNLczFUVER0VmFidGpvS2xrOFhoajEybDBTano1NTBEb2M1?=
 =?utf-8?B?b0hkb2lmUURBcGdNOU9sbjM4Umg4VWhXUUVxQjdlMWpEYU1KaUpPSnhFNzJB?=
 =?utf-8?B?Nm51OEY2U1FqaHF3eG1KQ0RCbWZyMEhrdGJMWFVQbHcrRyswS2drVE00TEQx?=
 =?utf-8?B?TytTV2tyRHlrYWE3NEVqc25SN05QVE5rWTI5eGZWQ1JBZHNtRDRwUG9TVWFq?=
 =?utf-8?B?d3pzNVc0ZmRpS3E5K0hGSDlDSCtCUkVWT2ZTV2wwNXgzQ3pCSzFYbC9nQUF2?=
 =?utf-8?B?akQ5bVZZRDVtYmxERDZjNkhJa2F5Y2M3TGx2UFhUd1Q5YUJiUHZKOUJjUGhZ?=
 =?utf-8?B?L2R4ZWF2YXoyQ0haTnI4U3NDRUxxVExQenZ3UUtoY2lxbk4wNWpGNTZrUlNW?=
 =?utf-8?B?TEhVNjZJM1dzbmc5cU10RTVYa2tzVFFIWDI1OG40WkE2K2dNYjgxVURKUHZk?=
 =?utf-8?B?YU1VNndzMW41ZUJvRSt1RUpIdVNYelIxYllUMGYxOE9WOGhXb2tvZWp3T1JN?=
 =?utf-8?B?SzJSYVRsVHJlYXMvQmJ3Vy9FNzF5c2xxOHhHTDhLdmNjTkc1KzFia0FVc0Z5?=
 =?utf-8?B?TDBwTXVhSmRRRWZPVlp3RFdueXFyY0RpNVk4S2FhZUNQbUVJbDNRaEhEZ2Z5?=
 =?utf-8?B?RkVyNytnZEtsM3FBekFNY2tsaWdLWUl5Ykg0cDRXMFNDaUNQVyt2OEFwNjBG?=
 =?utf-8?Q?xEvHCu/D8vqBw1Xo=3D?=
X-Exchange-RoutingPolicyChecked: 0bHKu+R5PomIS28Js/wy0di6rlGa9H+XSbQ5JKrD97gUB6plgMSU6854HVltBzO8EmhWNjo63mCGA7fFRySBp+dfLfc/K9Pq7IFr7crm3tGdiav8dAgvJluermg+5+5hx0qCOV+lWXVTQSF0qhhFgjKu4QlHJOCH2Q7rL/ehvBG2LkcrH1qABcBQYAgtV/urzI7nzknMB9pg8YVeLAfl3rRA3U9/htKrsgWhfwZYQwjKoTL9ORkBVwvGsW+ClLeEkH2k3wN4rONa0DVlkieABrUi4d4/tzVpXe/LErqmWOBIZZa/jNRL/o/mwBpF+SBC4/e4bypcw9oln4Ip5QWaMw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 937b4ac3-cd05-4271-ef83-08df3bf60af7
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 11:06:44.3005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f+vNRXKembMYOiuhKid0+ACG4TF/MLOkMISyB89hVzvBjolVJs7Yw12UuhZkujlhu6YnP+hyoU2dm9cvl2qZP1VdpCntxV5SIqwZPtwZNS8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF1AF044E07
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

guc_submit_fini() stops the CT but does not complete pending TLB
invalidation fences. If an invalidation was sent right before the stop,
its done message from GuC is dropped and the fence only completes when
it times out, leaving its waiter stuck for several seconds.

We hit this while disabling VFs, where the VF removal was blocked until
the TLB invalidation fence timed out.

Let's reset the TLB invalidation state right after stopping the CT,
as is already done on GT reset.

Fixes: a6ab444a111a ("drm/xe: Forcefully tear down exec queues in GuC submit fini")
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index b14b37b767f5..a911c7cb9e28 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -47,6 +47,7 @@
 #include "xe_ring_ops_types.h"
 #include "xe_sched_job.h"
 #include "xe_sleep.h"
+#include "xe_tlb_inval.h"
 #include "xe_trace.h"
 #include "xe_uc_fw.h"
 #include "xe_vm.h"
@@ -265,6 +266,7 @@ static void guc_submit_fini(void *arg)
 
 	/* Forcefully kill any remaining exec queues */
 	xe_guc_ct_stop(&guc->ct);
+	xe_tlb_inval_reset(&guc_to_gt(guc)->tlb_inval);
 	guc_submit_reset_prepare(guc);
 	xe_guc_softreset(guc);
 	xe_guc_submit_stop(guc);
-- 
2.34.1

