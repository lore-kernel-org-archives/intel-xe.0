Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1154A606A321
	for <intel-xe@archiver.kernel.org>; Mon,  9 Nov 2026 16:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c3JBIiEt
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9E6210E24C;
	Mon,  9 Nov 2026 16:17:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8037410E24C
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Nov 2026 16:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794241064; x=1825777064;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=OuzK/Rjf/EZk394cLVWWQk/IC0FnHBWBH+M2MDzYMe4=;
 b=c3JBIiEtrmtEukOXBqfjrBB1JxM/R7TtLAp2N+D/XILrj/ViedexH6Qd
 a9G6pNOIWt2A+jVuD6fPPOHjGpXnWsfaPbOushlKrT4ANsPS0BrJ2+BbZ
 X2dTV9Z8kZpfpBrinN0q3Fo3d0Ur5+D6Q0INpxN2VRU1eL2ieWqpr582j
 22BQ5FbZSY01mdC/5BkUAeiC+PKaw32Dn52apikp+Q6ruoG+WwJzsArQQ
 GPeHtHtC04bsI1fn2D5WjGD75iCci+ImIET3gU2W3AKqbC8ufpsSlwz0X
 IvCRWVYHmhI5ekAuGRPIx8238IA2Qp5i943HAr4AN8QXY92KSEPawqaIX A==;
X-CSE-ConnectionGUID: LrxqMinMQSyHvEIHTZKGOA==
X-CSE-MsgGUID: t1vArBPPSRWO0djkZ9qs2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2852517"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2852517"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 08:17:43 -0800
X-CSE-ConnectionGUID: U23Y5dkuQK+fCivb25TFYA==
X-CSE-MsgGUID: Ghx/JdIOTEW82MWIldTAbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="9649336"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 08:17:43 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 08:17:42 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 9 Nov 2026 08:17:42 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.22) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 08:17:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d53PrHN37Au78SPbUuEKo8h6MB47JDRPBykWygO5ol/EgbVbr+UF4cY/WCJIc9Qqb7/cO9zTwrGVURcIfvGKUSi+iXHkuNoaN+N3GJ1yLz/okMj5oddkuNy5m54Je+3ThGBTg6vmx4A65A4W6y8CODf6HQq0pKO8rPBPSU6Yr3FAVF811Wg6TO68qxDc5zwHk5vEeGp/OZGJdAnFP0YP9QxpfndSbo889HA5eXjWuP+NWBpA7uimKUPhlYfnvtiWTxe/HW+ZlnNdNhWgmU3pFDLi/GzPcZ5hSdpzMDXiqZnaWJ9nwavdn8Qs8vVAw11Nycky9lWPPSQXt4chWFnZkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vNhGWElP61wCJjZGyxqAgGXxo60UDrOKq+fVg3PsO2Q=;
 b=Wjmw08HE5WAw+tq1qWxv/iptO9hO4jzDfr6RFItL/KRFWbQ4a2+qAG8MwSD3qL4O804gRTGxZ2T27jzlg+mryMpifdUnH73rdzwSuXuavoB8s3iC9zHx3nSeHZL2E38ijhT7PrNYF/5C/dnDq63D0C/pZ81lkTOjLmXpUaBbF20zBKIWNjB9TJfH78XekMQy6ZhdNPHZoM88idyaBZHiX/1/92qVibmTT/B1gzeuAe6/9Qf+3B1kfh0j7ycuggyjB6VbrfnFIZHQNppAnfNQBXwSoPXSpoECaO+0ISfNM9R+b3gsEvgQHs2BqrbI83Yvy9aAxDwIRlHmsFied+5DMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by DS7PR11MB8782.namprd11.prod.outlook.com (2603:10b6:8:253::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Mon, 9 Nov 2026
 16:17:38 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 16:17:38 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Riana Tauro
 <riana.tauro@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>, "Himal
 Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, Raag Jadav <raag.jadav@intel.com>, "Mallesh
 Koujalagi" <mallesh.koujalagi@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>
Subject: [RFC] drm/xe/ras: Report one SIGID per device memory error
Date: Mon, 9 Nov 2026 11:17:34 -0500
Message-ID: <20261109161733.3769906-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0105.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::20) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|DS7PR11MB8782:EE_
X-MS-Office365-Filtering-Correlation-Id: 197b1824-03f6-4630-2648-08df3e7cf8df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|6133799003|18002099003|261009223027099003|261026140227099003|10067099003|261021121427099003|261021123027099003|261022105027099003|261028144727099003|261022075727099003|261022113327099003|261026121527099003|11063799006|56012099006|261102123227099003;
X-Microsoft-Antispam-Message-Info: nNXX6O/5Jz/C1HosKsnOol9SNc2JLp3SivKpDlv1QiKBmW+U7p5a931X7xD+EdYk81D4wp4w9bFlqdql1BmvKcbhZ78xUs7BW44f8GgAsWcnn2ragQz1RLc6oZ1VNJ38uvvfH0MSyGRnE7iS9C8G/ecRDYh5JIIEZtJmjc2KFzsNQGsY3A9wtI+Q979VzktB0OnZ9U46+uUVV+tC7qGUM5U6rX0cNjss6OedQPza9y9iOjXIyxTYNCM6lN0xILiSYnczJpcUMdvdG7HkGlLdndmtinGOwvmtHDuGyD7/I400XTbKgaSlzXuSeTBtl7IiV8KyHdsZrVUyK3oaSY9FhKqwjd5r+JHvxmPR7Mw7wM3V1qHlUuxXtrwoB/PPHALfbKEUpdbEnkmdjWZ6rRqlwApma9miEfWvUedqDTZmLvhp+1zy2J08YQPQ/sZLwJgYsRhORCPXBYWkupqgtGh053Jnub91xOggrrhz0Obl1uSfrJl0MTTZOKZ2qLSZMUblZSaVVNm3AsZAJXacH0qR0jqYm0i6th/GvxJ9d9djAI66RqdCFFgtF3VKSU3rn3PT4Urxfefshj9ToshtFOymkGxYXspK/c+Xxi1/lVhHJ6kpO7gc8Hd5B2iNcXqXUU6I
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(6133799003)(18002099003)(261009223027099003)(261026140227099003)(10067099003)(261021121427099003)(261021123027099003)(261022105027099003)(261028144727099003)(261022075727099003)(261022113327099003)(261026121527099003)(11063799006)(56012099006)(261102123227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?92jzRaauVk5HFKRDNjZh+STDtoJlnq5w7VjVKZ2Ghexc1HKl+luX0FwqWBxV?=
 =?us-ascii?Q?5U5gvcUaCmwbdvSc+shXgtOF4UfftDVQufo+GiXUwdrHOtAmvEjx0prsx3k8?=
 =?us-ascii?Q?C7+JkeLTUrMpjDNngkzRu1S54XXzmkcFChGFBrfJD19n0/ZWX1wqJm19B87z?=
 =?us-ascii?Q?5S0TMmsW6FBFW7gKjWd5n/c+zyj8A9y3t8SHmSA71NhG9I6KARfvoyvC4OIi?=
 =?us-ascii?Q?er5M6YEcZNn0N0i6Nvp76Z9Xso3UURu5j/pTzB0jCn0YSNvjayzv9TPFxtQ9?=
 =?us-ascii?Q?IVsot4LoxQvHMLI3DfIHrHaF0D3cn2aUzIs1aWr+V1WuiczfXNLM4adegUd6?=
 =?us-ascii?Q?90ANQmTViq2b8xqEf9+gp8FAS/qMlazKxWzNqZz4Y+Q4Uos6sC8vYoWyOIAG?=
 =?us-ascii?Q?6d6Wy84/L6x/L6j4BSgUs+5iZ8wT43JSP7izPXnUVHXR55Jxcngl7OPxOUxU?=
 =?us-ascii?Q?C8R5cbo5B9SxjxtHvZEJEdCD3elt1nmtZAdGG1PkDv3bdZ+Jyi3Yg6BUlFQ0?=
 =?us-ascii?Q?8fsxMARNdvPk2TWX5xfes09got2+rhVFAWI2vd/y9xa6HX0ighgOx12PKRPm?=
 =?us-ascii?Q?pGEn63oqB7C9shXGCzRfezSqnu8ya9XHP0obwdxxl+JF8SB6zd2XqB8Fb/Cl?=
 =?us-ascii?Q?ZYtejjwKuzhp9bUcLEiyhUOjQnU6n3pMPwm+Aiji6dNU0u2wdlAreNOZK8JI?=
 =?us-ascii?Q?/2bOA9b0qxR1nuwRT3MBuZ9tuoJV1I7/S49zkQQhYu4cyfnGkbGUtfrxhXiO?=
 =?us-ascii?Q?RnO/9TnfPNEv8/JjX083WBrR6mpq7xQLCKuDBm8RCqiF+5pY+a6Zp3+bj9Yj?=
 =?us-ascii?Q?XC/aYBmGexaQqpslvxdNeUDJzMgq6bXqOzHhrOQWuYg4zt21ZfzWNoBvFwme?=
 =?us-ascii?Q?woQycqgqpCGHD1yN5XP+S7hOjiGDjwoUJ78S26rvUPVxGa0nSQKq5pYNX8Cp?=
 =?us-ascii?Q?pdfTJlnrSdOcuSYG0Ros8/p5AoGdppHiyANlxVH0xgQs0kGIw4Idss6emaop?=
 =?us-ascii?Q?7cKsI37QmOZeYRC8t7B19kZFR9E45FlZ+G+VVaydZweEzCw9QfuuvmchVDlx?=
 =?us-ascii?Q?bBSnelZuRbrZJ7mXJXE/1F6vJ36FB0uTVEck8Th16FiwUWKwLvoKxTgp14UX?=
 =?us-ascii?Q?VjLxtyAtZd0Z3HJgvq14eNy/7grARupBycl5KO0zxvJvx9HnD8BgPsMRlqQK?=
 =?us-ascii?Q?QQH/AdZ4OMHuc9TUUhZ+cr4I8cXZ1RzPbRIClXAebVsinq+KXjlubgJ3FtzD?=
 =?us-ascii?Q?yaO/02UlCa2eTh6I2m7ZOVRqbcEj4PyFi6JpF7ThkSMD2LSkx9sQOIrZ9/RE?=
 =?us-ascii?Q?PsOfBjVCvkLkwc8rn0yHzJET7Jc2QXiEj6xLIlBK2e5W2JatNXaytIh+d8Nh?=
 =?us-ascii?Q?4Zb//7SfHLmPf8o/bFlqXw114p/Ch9ZC2G4yP2C8gQLNYhahOr4g6Jjg+k4a?=
 =?us-ascii?Q?B8J+zTvmcWz86AEme7+o1QqcQnnFacfo8t8v09b2CdKht0s+o9JoCLy8T/S9?=
 =?us-ascii?Q?NIw1soLc4jQXvkKCwUdbsWEd0/2l5MDUXb1x7X/jF4ZBFp3fZSKneGBUJalx?=
 =?us-ascii?Q?YiMAd5gAZOv943TRXxmhUwa7G9nIWUZUZZB5UNQLNQwnN1CiMyve1k/keDag?=
 =?us-ascii?Q?eBmAs5dHbobZPrxrxsVoJBDNaANrHz5Fne8N9RkgExcOVC58oU0WQymnlELt?=
 =?us-ascii?Q?EovgO6psgGiOg128HrTQO+C/w6QV/TnN1386mJ8E86eq9SWXu/pNCOMWVINg?=
 =?us-ascii?Q?05NfgNKMSA=3D=3D?=
X-Exchange-RoutingPolicyChecked: 19aBvmY9pezO+ZjmMkGN72DsB2wN21OgWa9Zhuw0u95viXw6yRrSDlRyEAizHRjWBDWUzdW0NHUVDCsa23bbZTD0kQTo8gzDogcKgeCaxw+V81EVNVilSUkLTM7LfKlDagYWM2V7UgqVY493oip70Has/fLOYty9nNBbnmP+73RnPVBOZxGnd0Bo9AZSu0T3uegbWR5AtCimDNM/QlqEQAxcbIFNXldicnTcg/J0MqmRsGrNtAHYNVaDlm7NIPFwl5CNjG7wMAD0+sfBZzIo8Q++0uQg/ZZFy0EtdjN5+fPBn9kYYzWWbclfA4avf9KzqoO7Vok/VbO+2PTk74Zgbw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 197b1824-03f6-4630-2648-08df3e7cf8df
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 16:17:38.4044 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kSWnIjmds5E6qBEzskjJdmTAlDziQVNlarxdwfmCwh3U+RUVFn+00I3gmfw5merfuUitrPs2Oom9LaR07p9Oqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8782
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

handle_page_offline() logged each step as SIGID 202 RECOVERABLE, so a
single double-bit ECC error produced several 202 lines whose severity
disagreed with the CPER record emitted by handle_device_memory_errors().

Log those steps without a SIGID and leave the caller's 202 with CPER as
the only report. Firmware failures keep SIGID 105.

Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---

AI generated and untested.

Aiming to solve the discussion:
https://lore.kernel.org/intel-xe/520a56ea-40a6-47bd-84a0-be5cf604e5e7@intel.com/#r

I agree with Badal that we should reduce the noise in the mempage-offline
that is only bringing multiple entries of the same and then emmit only a single
SIGID and a single CPER for it.

 drivers/gpu/drm/xe/xe_ras.c | 32 +++++++++++++-------------------
 1 file changed, 13 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 2c01c183d02b..5b13daf972ba 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -269,11 +269,9 @@ static int send_page_offline_cmd(struct xe_device *xe, u64 page_address,
 	request.action = action;
 
 	if (action == XE_RAS_PAGE_ACTION_OFFLINE)
-		xe_log_err(xe, DEVICE_MEMORY, 0, "Requesting firmware to offline page 0x%llx\n",
-			   page_address);
+		xe_dbg(xe, "Requesting firmware to offline page 0x%llx\n", page_address);
 	else
-		xe_log_err(xe, DEVICE_MEMORY, 0, "Requesting firmware to remove page 0x%llx from queue\n",
-			   page_address);
+		xe_dbg(xe, "Requesting firmware to remove page 0x%llx from queue\n", page_address);
 
 	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_PAGE_OFFLINE,
 				  &request, sizeof(request), &response, sizeof(response));
@@ -326,7 +324,7 @@ static int handle_page_offline(struct xe_device *xe, u64 page_address, bool noti
 	/* User policy set to disable page offlining */
 	if (xe_ras_get_disable_vram_page_offline(xe)) {
 		action = XE_RAS_PAGE_ACTION_REMOVE;
-		xe_log_err(xe, DEVICE_MEMORY, -EOPNOTSUPP, "User policy set to disable page offlining\n");
+		xe_info(xe, "User policy set to disable page offlining\n");
 		goto notify;
 	}
 
@@ -346,14 +344,12 @@ static int handle_page_offline(struct xe_device *xe, u64 page_address, bool noti
 	switch (ret) {
 	case 0:
 		action = XE_RAS_PAGE_ACTION_REMOVE;
-		xe_log_err(xe, DEVICE_MEMORY, ret,
-			   "Poison detected at physical address 0x%llx, page soft-offlined\n",
-			   page_address);
+		xe_info(xe, "Poison detected at physical address 0x%llx, page soft-offlined\n",
+			page_address);
 		break;
 	case -EIO:
-		xe_log_err(xe, DEVICE_MEMORY, ret,
-			   "Poison detected at physical address 0x%llx, page belongs to critical BO and cannot be soft-offlined\n",
-			   page_address);
+		xe_err(xe, "Poison detected at physical address 0x%llx, page belongs to critical BO and cannot be soft-offlined\n",
+		       page_address);
 		return ret;
 	case -EEXIST:
 		if (xa_load(&state->offlined_pages, page_address >> XE_PTE_SHIFT))
@@ -361,18 +357,16 @@ static int handle_page_offline(struct xe_device *xe, u64 page_address, bool noti
 		else
 			action = XE_RAS_PAGE_ACTION_OFFLINE;
 
-		xe_log_err(xe, DEVICE_MEMORY, ret,
-			   "Double-bit ECC error detected at physical address 0x%llx, page soft-offlined\n",
-			   page_address);
+		xe_info(xe, "Double-bit ECC error detected at physical address 0x%llx, page soft-offlined\n",
+			page_address);
 		break;
 	case -ENOMEM:
-		xe_log_err(xe, DEVICE_MEMORY, ret,
-			   "Poison detected at physical address 0x%llx, failed to soft-offline\n",
-			   page_address);
+		xe_err(xe, "Poison detected at physical address 0x%llx, failed to soft-offline\n",
+		       page_address);
 		return ret;
 	default:
-		xe_log_err(xe, DEVICE_MEMORY, ret, "Failed to handle address fault at physical address 0x%llx\n",
-			   page_address);
+		xe_err(xe, "Failed to handle address fault at physical address 0x%llx: %d\n",
+		       page_address, ret);
 		return 0;
 	}
 
-- 
2.55.0

