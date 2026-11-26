Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141E4606A331
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 10:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fxLHez5w;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=aNUUTiPS
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFB601122AD;
	Thu, 26 Nov 2026 10:08:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5121F1122A3;
 Thu, 26 Nov 2026 10:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795687713; x=1827223713;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=NxqMMYqE5nuW40tziroD2cRLF5SGacRtnUSlwo9AYsE=;
 b=fxLHez5woi3BmVfP9k1JAXo3plFoDt0Yzj/gJbGpnMY7MBxz5oORMmit
 U+7cHdSnbvZM41TlIbPlSXLyjj3NLm+1Blh0w1s5tWDRBf23yJI3nl4Sg
 Sfy7m+NNBRENGHjWhDNjz9qD2dl/Gp32nbx4Jug/FI8DFNSPDGtxaOWgv
 giUmAqMmN7Qj4YE7r/akMAnR3wMQAxAEDN1szVtoILpTnjb9mf6U61P80
 IRUsBJaVPHmYnppVhSH976bTPbRjCjMvE41QCQqrLZCnBgvbIE3FxfESl
 gkJ8Z2Ghj9fjLq42W4P69j6hBs6TXdB270DGtdiV2UmKJ9WLhast6sTkd w==;
X-CSE-ConnectionGUID: cRG7nxxWTv6DKizegkz9LA==
X-CSE-MsgGUID: y3bxp65fRFefItQ4hCa6mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4677553"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4677553"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 02:08:29 -0800
X-CSE-ConnectionGUID: AHRM9/b8TpaQ4OkjaYuuKQ==
X-CSE-MsgGUID: eb4deQTZSVGgZVX1/KdFag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="14169403"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 02:08:29 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 02:08:29 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 02:08:29 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.47) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 02:08:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qOLZEwJyQC0JbhJwBEhCguZ/10ltbkDYcs8d/Z5bt2KbXgshesogBoZEEGxFnzxdtiN3SGL8gWTuUWgAwYFe0F/BLRDMp/g46YeirzrHWg2ads52zrAjyxwPlzI3GZdEuVF+JLhTHNd4D546eiOXmxbVduEEOyU5FpC2PRM5AU1NdzlLoScY/Fu6XVsUBFVzQYjT4Z0J5WPohO+TAHWqZbWVz06oAKxULuSWPTluSKIS64MO0xBhf6h2sj8tIoAQ7Wq2HBJQmNp3uZffhLEFkBzacrbLyPIoPu5xeIWFNIBERhCxyBz9zvTwFXFL/Sab++mWx/IzefsIfLa9VkR2fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8CP0n8wIBi/tGarumtkWyKEvT0aU8uCyXB7xCU1YVfk=;
 b=g/FvFgQIkPd5XSBxoOwDcS8rRE6TtOoY+PxySDhE4mBKXs6QLNzn7LO8WnkKu7OVwv7EGIFw1X5ksLoI5hhqA5Jia1epgnbBLYXF4QYew1ssDd92sDzC/yPA/H9U+BQEg05S7zJ53IN7E/6N9SLy4WUchOWg3g2wEVsKxXbHbBRD9VTprrlsXeFZbSvF7YdtU9A/O/U4HR8NHlx635J3bmthZfoh3MYUbXIMS3oX2xGczIsqUJ1iXrNA9uSblGi412IAUxtgmoRzKZV+t/E/ZNt+eEA+KdqnOPmH2kw2WB175OFShlDtte78hDegzGe5Yoa8hwpfHXx809BGLV0aCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8CP0n8wIBi/tGarumtkWyKEvT0aU8uCyXB7xCU1YVfk=;
 b=aNUUTiPSVIMlD/L4YZuRvAi1s5tz7l7ktBCfJWsJo0fVbW4r8sZzuB3Q8CzxvKIqoh7nq8dlcyG09IATwH3Z6VLY7W5U158X7rEWqg+9XnUCaIk6IudOn3FIuFOw88jYob/lZUTPc1AHVKKN+vRb7/p+qnb7sK1NtrKm9vJF/UE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9273.namprd11.prod.outlook.com (2603:10b6:208:573::17)
 by CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 10:08:17 +0000
Received: from IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa]) by IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa%6]) with mapi id 15.21.0662.001; Thu, 26 Nov 2026
 10:08:17 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: [PATCH 12/13] drm/i915/ddi_mgr: Handle DDI pool system suspend and
 resume
Date: Thu, 26 Nov 2026 12:07:52 +0200
Message-ID: <20261126100755.1252635-13-imre.deak@intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20261126100755.1252635-1-imre.deak@intel.com>
References: <20261126100755.1252635-1-imre.deak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF0001DBA8.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::6e6) To IA3PR11MB9273.namprd11.prod.outlook.com
 (2603:10b6:208:573::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9273:EE_|CY5PR11MB6366:EE_
X-MS-Office365-Filtering-Correlation-Id: d239c3a1-8e5d-4f0a-4ef7-08df4ba5309d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|10067099003|56012099006|11063799006|5023799004|261026130827099003|261026135527099003|261026121527099003|261026140227099003|261028144727099003|261022115727099003|261022113327099003|261022105027099003|261022075727099003|261021130227099003|261021123027099003|261021121427099003|261021135927099003|261021133027099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: Q2X8ZewU9TdOjvEGS7cLPTw9q5k63cVdr0GqbKa3W9Q7ZHiZ8uhgfIzIDrJEwvdSsO1I1FNSsA6Oc3rHx6TW2zl9Hgczbx74nydQimD+hjFsbqJjyq959g2rU/+7HF60R1B513BMj1eImR1EMElt4U5Nmw2N5FyK++78srh0mfdk4bO3M+K7KuWmVtikvuDXtS+23JZTSGhUBLLiU/XBrnRQeTY+BAeMkkjPt7jyW/aiokWTG/gfX/OHL0QzCHmsl0g/VBgFRjQOrkhUuYpSscarWdq6n9Vzy9WWWHCUIOO0tFJo6J/bTFrv1uc3CCyr5iqX7uZk16I3eUYNRLxXD7u6srVKqty48pltCB33cX+THHzAt2J4eBp260Gh+EURxFHCDpuZbFFhRQiVANtTrXSMc7Z5w/9lmE24J4MkJdegsDY980QmqF7DS84XkWnHNLNuzyerGSD0VOawd5DwitYwP7IJQ0W01dejlCmqsEvqKKtohix/KU6hT/sYqTY0Oflip5uPSg9Pc8YhOhzXVBcRHW2qL3QUCS6gT9Lwmd089jieKO472w6AWXaHpYODo2VTy0P5a5REjyXwBH81xe/SBr5PJxQaMqRSZEicYcePAvmuHGgzYQPLO8AUZvuxQUM7WHCm3LKFFWTUQist2S+1gcnhEUXJYzb/GXbw+Ko=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9273.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(11063799006)(5023799004)(261026130827099003)(261026135527099003)(261026121527099003)(261026140227099003)(261028144727099003)(261022115727099003)(261022113327099003)(261022105027099003)(261022075727099003)(261021130227099003)(261021123027099003)(261021121427099003)(261021135927099003)(261021133027099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fRX/lOVu+pNuT7VM9FbwEWjg48CWa3iMDtkHELjruhWEuXCQHCsLW58HKjr8?=
 =?us-ascii?Q?76d4A+qgcus4QOgAMrdDCFNLFT2EC6VArocIcMJhB2Qcwqoj6Aq7sEMHUlYv?=
 =?us-ascii?Q?ahA5YQX/B8Qi6hVeQ7usd8RoV2esYV/9Xz/VTekfZHo4QtOry7mVPGB6EQzp?=
 =?us-ascii?Q?XfyQmS4PUiPEw9RIwV6PIAR2snUza6wh16UX2vVaUMWEDqrlyxHjKK5QhWFF?=
 =?us-ascii?Q?6366UvXU2AcjK1x7vJFnVlqMPgU9UsOW8qzTjmgmRB8tGRN8uTCePgurdI8d?=
 =?us-ascii?Q?yvGcyedjcmRnkklgfNGn1s9sS7FP7s41bFXFYV2hILc4e8yD8ZD5WCNgqIQR?=
 =?us-ascii?Q?e7uXN2eQS155gWxnQorpMJsGsCvN3CeirDxOdXJcjoFiVHZDiOMfygTeedfb?=
 =?us-ascii?Q?/30Kol+KZ/KnnrGVXCPxZEVz72gApHO1CbcAvtYuYZ/ni8SjDNzIahRrM8Kz?=
 =?us-ascii?Q?kbTB4BV96AtPDRlhnqEw03zjXY9c91ngdGF6bAQ8LEInxRRsp2TFmsJeV8lQ?=
 =?us-ascii?Q?HEQ15gfVGVJCK/QrApBTAfx7wR1mMckPak9khTYiOD55oRMGouG/D6cdYQK4?=
 =?us-ascii?Q?Mczwje1UNdBxo/dNyBrzKv1PoddKG/WUM1r053GjXUMpiH2meUm9e43wisar?=
 =?us-ascii?Q?YrnZndPcbS1AHfvZImpzUW5mVk+BcD8TjbdG4klhOQrVxF7HrYYp5eDhADWP?=
 =?us-ascii?Q?PPN/2BVgRCOt4WQaUq4RINd5Iju2Le/oMV+a6lYtk4C6R12TWX9a1rLNW4RF?=
 =?us-ascii?Q?5JtPxo5xI6Sv3AF/IoL/mpGL/tN1opwVCr2C7UPke8XCmnICznQ9XqQ4rlLh?=
 =?us-ascii?Q?u0N+JQMpmBNhPlmO6OqrDHHxA1h4OOhhrpaMOqv0FjXs1ludhxI0aI5Q+RtU?=
 =?us-ascii?Q?iNf2Ns2XT73MqRrwyzXdCAXzUyMAHGaKe7HFkVdwMyDL90qKb/LPsQyQxM3x?=
 =?us-ascii?Q?+Sj9e7mALwEb1fztlBcsm/fP8juhCmasUlZVaFQL2rOur7oJdt6pYrznS905?=
 =?us-ascii?Q?ZHB9xFLICORNPzSjdevNA31zfogEmMbXbpxi9d5lJBVaHODZ4wLC2ZuCsD/F?=
 =?us-ascii?Q?PHvvLvv9qeyPWYH8CQUChr+CLv9eIUWb9uMDZ1LELIPN1ZMzrw96/yf8MO3l?=
 =?us-ascii?Q?pBxV6F1411QqXErdrPktBcqf0OHrM4dStsq5EtRWp6rYoGUjx3gZ2ezDfkFz?=
 =?us-ascii?Q?AzLEKj6AckJKZwMOTQvrLQynWCdMEgHkInzHxVgVTkdmYkap4IblvvjJ/dNt?=
 =?us-ascii?Q?D995t7mMaXIku1sXA5TvgrXbW1PTOtd2HWnjLcw7mtWmeegU5Oko9aff/F7l?=
 =?us-ascii?Q?/mfZKyCcf1l2/MG8iXFSn6YLUHO/MMI3Q8nBr+W/gifuNro/e4/jFC+frveM?=
 =?us-ascii?Q?08Jad4Angbt97kcJwXBLNQa/i5R5NknrYtkmqYKQYHpA+2VBUDV/zD6IpQGI?=
 =?us-ascii?Q?fjOz7rdwLKjpPmQp0rneWlrmh4Q7aWfOb+VrH1ZbNq1YDeibdpNsu6+EkmZ/?=
 =?us-ascii?Q?fhXNOI5pNApGd6hsZpLtSMiFh8YLCuUlax7bSZID1geQzmhvWI7ECB4Fxfmd?=
 =?us-ascii?Q?wwwZ9cfHK6xtPLruT6hjqUJtb9gO3g6sI5Js1o7h/F0gISt/DlM2sjDcTn+c?=
 =?us-ascii?Q?pcWIo8Lc6CVliZ6yvygepmEq5vRd95CG7FndBkN/JlonC/xJ0f3/62k7C1GN?=
 =?us-ascii?Q?WB5CK2CdH+Z6RcM2/J7YX+XZM5hd3OCuQt2JXupSygy3uiAbN77BbHML2uLJ?=
 =?us-ascii?Q?EArZ0OrxNg=3D=3D?=
X-Exchange-RoutingPolicyChecked: e7r8LNm9ohxt/Rdc+0elknQ38T+RdXEgHDLvxcQ35Si0q6aTHhhc3WH8WBU2Pl8Vhnl4yzBTl/d583NOfk60sU5e/qBHLW+A3AnuonUioc2XFzvv7cgxZFkG5OqEDwHkKPNDTIUilbT2Si/MMtdLmePRDOK7Hz5ti7RrSM7mhHAYo6VRS10VtSdXhwNchxAoq8BASZDSI5oKf7wTzg2wkFeMjmKFkPy0uPrvegOzXIRL+ZvGPLK1SDDsAoojbe8J1Nk9Riw0UCKWai3Y4w6Ky2M+Xihbt4/Bsqc8zW61FM3nMJo3MHduoFDtuPp04tO5V+gMP1bM3XIp1RfkCwQkeg==
X-MS-Exchange-CrossTenant-Network-Message-Id: d239c3a1-8e5d-4f0a-4ef7-08df4ba5309d
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9273.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 10:08:16.9173 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XCUSIGj7kI8SeRfA8h3KdovmWUyFsxX0wC4DY+gZ/IOrMYZ2Edp+Nyml9qhSPLoVN0rlwHp4F3QhziYMF+osWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6366
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Firmware may change DDI assignments during system suspend. Rebuild the
legacy routes on normal resume after IRQ postinstall masks HPD, and
refresh encoder VBT data, Type-C mode and lane reversal before hardware
readout and modeset restore. Update the logical HPD pin to HW IRQ source
mappings while keeping each encoder's logical pin fixed, so HPD block
counts need not be moved between pins.

Keep legacy assignments found in hardware. When a legacy PHY needs a
new assignment, prefer its pre-suspend DDI before identity or other free
DDIs, keeping the same DRM connector where possible.

Rebuild source and common link limits when a route changes, resetting
link-training/recovery state while retaining cached sink capabilities
for normal resume and detection.

Disable pool DDC adapters during suspend and restore their routes before
the resume modeset. On failed xe suspend recovery, preserve cached
allocations and HPD mappings because HW HPD IRQs stayed enabled
throughout the sequence.

When restoring the pre-suspend display configuration, reject modesets
for HDMI connectors whose encoders no longer serve HDMI-capable legacy
PHYs, or DP connectors whose encoders now serve legacy PHYs without DP
support. If DDI configuration fails, switch the pool encoders to ALT-only
operation, allowing DP restores while keeping HDMI unavailable.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi_mgr.c  | 77 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_ddi_mgr.h  |  2 +
 .../drm/i915/display/intel_display_driver.c   |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c       |  9 +++
 drivers/gpu/drm/i915/display/intel_dp.h       |  1 +
 drivers/gpu/drm/i915/display/intel_tc.c       | 13 ++++
 drivers/gpu/drm/i915/display/intel_tc.h       |  1 +
 drivers/gpu/drm/i915/i915_driver.c            |  7 ++
 drivers/gpu/drm/xe/display/xe_display.c       |  6 ++
 9 files changed, 117 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi_mgr.c b/drivers/gpu/drm/i915/display/intel_ddi_mgr.c
index 8f32e7c8dff27..a0157ff6afc04 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi_mgr.c
@@ -840,6 +840,83 @@ static void update_hpd_sources(struct intel_display *display)
 	}
 }
 
+void intel_ddi_mgr_suspend(struct intel_display *display)
+{
+	if (!intel_ddi_mgr_is_enabled(display->ddi_mgr))
+		return;
+
+	intel_gmbus_ddi_pool_update(display, false);
+}
+
+static void resume_ddi_resource(struct intel_display *display,
+				struct intel_encoder *encoder,
+				const struct intel_ddi_route *old_route)
+{
+	struct intel_ddi_mgr *mgr = display->ddi_mgr;
+	struct intel_digital_port *dig_port;
+	const struct intel_ddi_route *route;
+
+	if (!encoder)
+		return;
+
+	route = &mgr->route[encoder->port - PORT_TC1];
+	dig_port = enc_to_dig_port(encoder);
+	encoder->devdata = intel_ddi_mgr_get_devdata_for_ddi(display, encoder->port);
+	intel_tc_port_set_legacy(dig_port, mgr->enabled &&
+				route->mode == INTEL_DDI_ROUTE_LEGACY);
+	dig_port->lane_reversal = intel_ddi_mgr_encoder_has_lane_reversal(encoder);
+
+	if (mgr->enabled && old_route->mode == route->mode &&
+	    old_route->phy == route->phy)
+		return;
+
+	intel_dp_update_source_caps(&dig_port->dp);
+}
+
+static void resume_ddi_resources(struct intel_display *display)
+{
+	struct intel_ddi_mgr *mgr = display->ddi_mgr;
+	struct intel_encoder *encoders[INTEL_DDI_MGR_NUM_PORTS] = {};
+	struct intel_ddi_route old_route[INTEL_DDI_MGR_NUM_PORTS];
+	struct intel_encoder *encoder;
+	int ddi, err;
+
+	/* Only normal resume gets here, with HPD masked by IRQ postinstall. */
+	memcpy(old_route, mgr->route, sizeof(old_route));
+
+	err = configure_ddi_resources(display, old_route);
+	WRITE_ONCE(mgr->disabled_ddi_mask, 0);
+	if (err)
+		fallback_to_alt(mgr);
+	else
+		mgr->enabled = true;
+
+	update_hpd_sources(display);
+
+	if (err)
+		drm_err(display->drm, "DDIMGR: Cannot restore DDI pool: %d; using ALT mode\n", err);
+
+	for_each_intel_encoder(display->drm, encoder)
+		if (encoder->type == INTEL_OUTPUT_DDI &&
+		    intel_ddi_mgr_is_pool_ddi(display, encoder->port))
+			encoders[encoder->port - PORT_TC1] = encoder;
+
+	for (ddi = 0; ddi < INTEL_DDI_MGR_NUM_PORTS; ddi++)
+		resume_ddi_resource(display, encoders[ddi], &old_route[ddi]);
+}
+
+void intel_ddi_mgr_resume(struct intel_display *display, bool suspend_failed)
+{
+	if (!display->ddi_mgr)
+		return;
+
+	/* Failed suspend leaves HPD IRQs enabled: preserve cached assignments. */
+	if (!suspend_failed)
+		resume_ddi_resources(display);
+
+	intel_gmbus_ddi_pool_update(display, true);
+}
+
 static u8 legacy_ddi_mismatch_mask(const struct intel_ddi_mgr *mgr, u32 resources)
 {
 	u8 ddi_mask = 0;
diff --git a/drivers/gpu/drm/i915/display/intel_ddi_mgr.h b/drivers/gpu/drm/i915/display/intel_ddi_mgr.h
index fddd69564b84d..6ddb30e826d4c 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi_mgr.h
+++ b/drivers/gpu/drm/i915/display/intel_ddi_mgr.h
@@ -14,6 +14,8 @@ struct intel_display;
 struct intel_encoder;
 
 void intel_ddi_mgr_init(struct intel_display *display);
+void intel_ddi_mgr_suspend(struct intel_display *display);
+void intel_ddi_mgr_resume(struct intel_display *display, bool suspend_failed);
 void intel_ddi_mgr_verify_state(struct intel_display *display);
 
 bool intel_ddi_mgr_is_pool_ddi(struct intel_display *display, enum port ddi);
diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index b018608eae032..a9b03b4a1e76b 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -780,6 +780,7 @@ static int __intel_display_driver_pm_suspend(struct intel_display *display, bool
 	intel_display_driver_suspend_access(display);
 
 	intel_encoder_suspend_all(display);
+	intel_ddi_mgr_suspend(display);
 
 	intel_dmc_suspend(display);
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 6f03a169931eb..60f041bd62979 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -702,6 +702,15 @@ static bool intel_dp_set_common_link_params(struct intel_dp *intel_dp)
 	return params_changed;
 }
 
+/* Rebuild source limits after selecting a different physical port's VBT data. */
+void intel_dp_update_source_caps(struct intel_dp *intel_dp)
+{
+	intel_dp_set_source_rates(intel_dp);
+	intel_dp->reset_link_params = true;
+	intel_dp_set_common_link_params(intel_dp);
+	intel_dp_reset_link_params(intel_dp);
+}
+
 u32 intel_dp_mode_to_fec_clock(u32 mode_clock)
 {
 	return div_u64(mul_u32_u32(mode_clock, DP_DSC_FEC_OVERHEAD_FACTOR),
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 36cd340d809f2..072facf627eba 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -59,6 +59,7 @@ void intel_dp_connector_sync_state(struct intel_connector *connector,
 void intel_dp_set_link_params(struct intel_dp *intel_dp,
 			      int link_rate, int lane_count);
 void intel_dp_set_source_rates(struct intel_dp *intel_dp);
+void intel_dp_update_source_caps(struct intel_dp *intel_dp);
 int intel_dp_get_active_pipes(struct intel_dp *intel_dp,
 			      struct drm_modeset_acquire_ctx *ctx,
 			      u8 *pipe_mask);
diff --git a/drivers/gpu/drm/i915/display/intel_tc.c b/drivers/gpu/drm/i915/display/intel_tc.c
index e01f367007424..df591966e08ef 100644
--- a/drivers/gpu/drm/i915/display/intel_tc.c
+++ b/drivers/gpu/drm/i915/display/intel_tc.c
@@ -1595,6 +1595,19 @@ static bool tc_port_is_enabled(struct intel_tc_port *tc)
 	       DDI_BUF_CTL_ENABLE;
 }
 
+void intel_tc_port_set_legacy(struct intel_digital_port *dig_port, bool legacy)
+{
+	struct intel_display *display = to_intel_display(dig_port);
+	struct intel_tc_port *tc = to_tc_port(dig_port);
+
+	mutex_lock(&tc->lock);
+
+	drm_WARN_ON(display->drm, tc->mode != TC_PORT_DISCONNECTED || tc->link_refcount);
+	tc->legacy_port = legacy;
+
+	mutex_unlock(&tc->lock);
+}
+
 /**
  * intel_tc_port_init_mode: Read out HW state and init the given port's TypeC mode
  * @dig_port: digital port
diff --git a/drivers/gpu/drm/i915/display/intel_tc.h b/drivers/gpu/drm/i915/display/intel_tc.h
index 6719aea5bd582..6d32eeb91d8da 100644
--- a/drivers/gpu/drm/i915/display/intel_tc.h
+++ b/drivers/gpu/drm/i915/display/intel_tc.h
@@ -96,6 +96,7 @@ void intel_tc_port_set_fia_lane_count(struct intel_digital_port *dig_port,
 				      int required_lanes);
 
 void intel_tc_port_init_mode(struct intel_digital_port *dig_port);
+void intel_tc_port_set_legacy(struct intel_digital_port *dig_port, bool legacy);
 void intel_tc_port_sanitize_mode(struct intel_digital_port *dig_port,
 				 const struct intel_crtc_state *crtc_state);
 void intel_tc_port_lock(struct intel_digital_port *dig_port);
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 923b239714b7e..8f87ad87d45ac 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -54,6 +54,7 @@
 #include "display/i9xx_display_sr.h"
 #include "display/intel_cdclk.h"
 #include "display/intel_crtc.h"
+#include "display/intel_ddi_mgr.h"
 #include "display/intel_display_device.h"
 #include "display/intel_display_driver.h"
 #include "display/intel_display_power.h"
@@ -1237,6 +1238,12 @@ static int i915_drm_resume(struct drm_device *dev)
 	 */
 	intel_irq_resume(dev_priv);
 
+	/*
+	 * TODO: Move this to display code, keeping it before
+	 * drm_mode_config_reset().
+	 */
+	intel_ddi_mgr_resume(display, false);
+
 	if (intel_display_device_present(display))
 		drm_mode_config_reset(dev);
 
diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index b36a7cc83420d..a267dc9ed93d4 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -301,6 +301,12 @@ void xe_display_pm_resume(struct xe_device *xe, bool suspend_failed)
 
 	intel_dmc_resume(display);
 
+	/*
+	 * TODO: Move this to display code, keeping it before
+	 * drm_mode_config_reset().
+	 */
+	intel_ddi_mgr_resume(display, suspend_failed);
+
 	if (intel_display_device_present(display))
 		drm_mode_config_reset(&xe->drm);
 
-- 
2.49.1

