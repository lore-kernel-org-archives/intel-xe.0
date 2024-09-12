Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CB0EED63A
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 19:05:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4173910EC33;
	Thu, 12 Sep 2024 19:05:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fjk0oeeb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9DFA10EC33
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 19:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726167942; x=1757703942;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=aFLTuJFRTW+5ri9DMePzGocgxHD7Aifztux6Mq7m02o=;
 b=Fjk0oeebrIYiVj/nfbc5wqg1iF5cMGwWI8Pns5Zp0pDSCbLPPTId72OU
 O9IMLRx0npVXcwFYVS4N6Ha45JaH8qbWxILP0jqNbNgbDjwXgvKz6UDTp
 xUMDlrxt6RfkwvseqBvdZxiaxXXvL9m9b3tUyJCeLQZMAHvSFSGHU3EUQ
 QYBG+UUZClJKIUmnodoWRJ/cK+1GqgpI7zWPAb26pMnjbsLuM+EiS2SVB
 3vYOLACxc0gE6qaE35dR6yxnIit3cWQmclf2Ic7Mc7NmKGj57WGld0LUH
 AxyLYI3tzAXmdhXhpe/90edF6V4IjZjj/7Kwq755KUj7PGCap235oKKT6 w==;
X-CSE-ConnectionGUID: DEwwplcFTXWZtAJngHJ5EQ==
X-CSE-MsgGUID: uL/OXJNeTfKwvYUw6goxFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25239845"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="25239845"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 12:05:42 -0700
X-CSE-ConnectionGUID: /6657YkoQmmS2z1zMaDv5Q==
X-CSE-MsgGUID: ujsw1vdPSxWwiA7QnXJKuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="71914398"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2024 12:05:42 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 12:05:41 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 12:05:41 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 12 Sep 2024 12:05:41 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Sep 2024 12:05:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y/0vVpINrhFcr1RdBvPWL+cHpsIvy6TY8BU8EMdQkopsxuNQ6F4daojnY/SwE4MljLuRZ3+B76oytEIUmYzFrkz/xe+ejQ7HYiQ5QlxKD+ML/2oe1VASoC89AyNm4uBotjWA5MEs2pfba0ekrxxZv0ExhiJmiGJ75QKJvGEmdNiDgB/UPLZ4VE8YqUXxoGpZIEHcpu16/QwY6UmUaTN35xrbw85l5QptuuIW7L3LQgklfu86njQqYIoPEUWNDplccIeHh3QJCwqYD68IjiLG0mfEeNkv3A1LyK1N7aHzedADLzndBrAk3dw9/S3/ve7JjSxL3dYLh7LgkXIVPzSIhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=exjlh+j/uLuuFAnUpkhdvs6L8j3+jDaxfM0Qnar8Urk=;
 b=Q1sQgdaXfmnbJSqoVfrXiDC2is6mXLgDL44OsAupf4Wiep8xIZktNTd4iSgkVbW7JE6zjSmT0QRrh6v8DQwegNg1faKGxgZGKMJ/KOEkmRvt4JjYQhNpxkDQE/SjdfoJvsTA/bQaAZ58oUy8Afk8EK61P7MC7YlBlEiGARTSWcpeycLLDNXcvmcvGgo80wQf06QWS7b+IWoRQrKbFA50XiWxHiPTSVetNEHpxgxIbaMSh8kbv13UdARgnba0oGI68YyJeZZSOnoYK8jJ6u9i320Id/ryQembPpA4JDfSyVYomfTt00j/tTHMnoFNL4XGpFIkRNw/fxDv9IYXJbCzUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DM3PR11MB8759.namprd11.prod.outlook.com (2603:10b6:8:1ac::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.18; Thu, 12 Sep
 2024 19:05:35 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Thu, 12 Sep 2024
 19:05:34 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/xe: Restore pci state upon resume
Date: Thu, 12 Sep 2024 15:05:30 -0400
Message-ID: <20240912190530.435976-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0270.namprd04.prod.outlook.com
 (2603:10b6:303:88::35) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DM3PR11MB8759:EE_
X-MS-Office365-Filtering-Correlation-Id: 4086924a-add3-45fc-42d6-08dcd35de0eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yxtorp9X4RYh5NLjxoJ/oVqVuqc/uBsq10pjfsjQx7SPcr9D1N9YVYYBqm6m?=
 =?us-ascii?Q?KgeObk0Sp5w3CKOCj6Fa5nfgfNjMZegEVQYLYjJt7cBw3oUmmuHANe2zjSSR?=
 =?us-ascii?Q?o63tNUr+Sw+bW4eXB7ZJrBP+/FkOk3EWC1/eLf87WF0LZHXKSv59Z56dOYMr?=
 =?us-ascii?Q?tLaYgQLmqXtmuLFt9CPy7X5dmGakhmZyGUSOCo8vAc81s/78z4cCsP3Pkag+?=
 =?us-ascii?Q?91yjx4xWR4AfSU0BNGZ9UiE/I0QoS50El+mwuxzxkgVKAJmh2AdAbAtvo75m?=
 =?us-ascii?Q?BUODJuHAQeO2w9Gx1oPzucINkMBzigQ1cvwdc+NuJx/bVvYb2UgPXR8OjO6a?=
 =?us-ascii?Q?Zhd1kZPDd6mX+3NTORWRCvRDT/hh/nNrrAiaTVuw8Qg833NjVN2gGGyM8YO9?=
 =?us-ascii?Q?tz8rLXkmI7sAVXDqSRBlOoZzo7zFpeszHZbGs1DDzYxzU6xv7lvM9UWHMos/?=
 =?us-ascii?Q?XOVwxXmqVRa7Sp0n96oIffMvFcouXcZEnuO3RYGhGNxE15PuxbH0TtaqWibu?=
 =?us-ascii?Q?aqrr0SGZr9urCSPeYg763z0m+5ak6hq8CeZc61ab29X6s33mWHEFw2iUId6i?=
 =?us-ascii?Q?8NxAAlSnrZeQjws+xygQN9+kWFbo7TrjRCoj5u8IL0Bl5gpWb6mBc9Dnidd7?=
 =?us-ascii?Q?2tKa4ww7qtATjK+hc7mYNrYF0csLAv2NvrDu3Z/77JzVDiicuaRQ1471Ulcr?=
 =?us-ascii?Q?6vSpbMbZGhKJDV2RdxtfegFFpa/PujrShe5r9LYJ06fgIYQ6hUdwWrQDt/Jb?=
 =?us-ascii?Q?YiHovAxgNd/bX39XvjVL75JsMZ4S48RtiwJJnXCf/yhpyRV8R2tbAAw25R1/?=
 =?us-ascii?Q?NeafxL8Ir/SZh04gfjuSsqVPyWCgiF2d9eBRojwJdz9Cl7070OT67WB2sC3s?=
 =?us-ascii?Q?PLEMk73Nly0OBgD9/x7xxVjDmGScBGEzo5z6EV8xnEly2WCAAb9xvpzvrGQ/?=
 =?us-ascii?Q?4OhLcdnBfdWodAIeWFicS6v8qtv+TcYRUoAWqh3v8tjcaeGNW60jU0MUqAMR?=
 =?us-ascii?Q?gf87GnDxsYSDeMyq4DTGYRXPrkT6uTwPdZV7PkkPiGNKoYZM6yMJg+gC8U6E?=
 =?us-ascii?Q?oqRHkIPhRnroZyKn0tNyj1a1hCU+50QknHC9lZoILSBcbmNFlJiInWXZklcr?=
 =?us-ascii?Q?l964CNJiyZY2Q5VW5xkP92AJBCOaa9QJCmOEdN/I5O8JUZklloZsnRDXWo+h?=
 =?us-ascii?Q?5tc18ygpGzXq1/BLDGs/MIKRSBN1NcuzyWPDP8vTFGaDBEAcZWzBKauIYBov?=
 =?us-ascii?Q?hll3Xz00NbRkktr8GusqjZw1PgVLRMbruqoe6wd9PZE5O30ofLjCIGexCpv6?=
 =?us-ascii?Q?Ac2FrKU9v95KvUQ4RRiQtLQmiHlBTsLyOj1C5eqij9dQHw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mAzP5saoMJu6myiAZ4u3tT8RVH5UEwifhlvw209piDgFmwHlnt5TYTUkYOnr?=
 =?us-ascii?Q?GQEE+JZ+Jm/2Jp0TLw5/SPceFdwg6wQcwSd5JkxpZo4eILRdz7CAzHSqz91f?=
 =?us-ascii?Q?rbHNoWFHdutHiGufLOxDvwvEd9/VwC7I8pP8NvhUUmTVr+f5AwG1GJ9c9qqZ?=
 =?us-ascii?Q?xrRiDbSew0ZCnre5wXoK2TeVHVsShZWgsrwKVa1NpGboEsveYi3v+k03EpMU?=
 =?us-ascii?Q?pZJ0SLy7ePg4hjjToeJpQ/Wbtiwva8w8Eie3qQX6nFIVjobAUX56WrpkTckq?=
 =?us-ascii?Q?X6thsFh6t7YJRAhI3seHP1qNwcdTWQ7z/PqnyUS3h2uYeoNVBwcj14zT+7lH?=
 =?us-ascii?Q?2eRaHskpn7TQp1fIjYvFlIeFR1C1zgvFSuyha0t3zkTvGUe9g8y34PfMu9tE?=
 =?us-ascii?Q?SBV16NSFKU4vRSaF3Hn0oOeiz2FA2F5GQVfg09z/PPq5j9P4Rv3hbVPZva3G?=
 =?us-ascii?Q?BUZ2dz8AC5E503lYIbYdFb3kgzzXzTBedlnKcI8M79NOmjfOVBKyovKBk257?=
 =?us-ascii?Q?+pxmZUMwVZVtVm5NI3V4PL1MtJiB2hYb4QZjOm3SXsFyL12Rgd2k12omjt5T?=
 =?us-ascii?Q?ClIkCRKBWAkHZkMkZg0ruNhZhu2CgdHSGwO3pLX5bGtvAEq92fvHAR7LA9Tf?=
 =?us-ascii?Q?6scXRrImvBPwvWKaufPLhGT13QCzXEsUwsAe3M5/Wxvw3vFmMmvlmcskR+Nm?=
 =?us-ascii?Q?wZgnA2Sg3POsy4w3shFYbyylK+0zC2OnxO+9gbw8q305CkalRHs1iWiZvqJ7?=
 =?us-ascii?Q?IdfPMl0rgkw6KaVT5X2JXwWsXToBgu2JZ/azZqSUeF2NjzrxPwWZxBIf8TIw?=
 =?us-ascii?Q?Rg37/LSO62E4NUjsDYTHEWcpgokEcM2e+AsDvCMjAZqRbEyPMJVS0C9eMySW?=
 =?us-ascii?Q?Y+go4lXFuF05aH4EWGpxVgpw16PmDyZtSNqmkP1LUVRUJdDjR4FdyYtEBXzH?=
 =?us-ascii?Q?d4Nj5KpwA/9H+wFIpksA07UhKbC2XQNg+tQEgEHjVgcRQd1OAPltb2un+itc?=
 =?us-ascii?Q?yQErVEuufZiLpFMS5bIiO6I35ZCadN4I8MO6jrlFyCnVlxNfh14WB73TJ7d8?=
 =?us-ascii?Q?N5bVASrDGVVKOnyYfOXAtkYv0dB+UDwEPBZ6ZuhMSR5b85rjsMiXFsPj2UAs?=
 =?us-ascii?Q?v2CzXJd67VTdE++LLXDPhX0npoeYbIFf1GfYTZ3DqiOQHjflK+B06QEHV/UE?=
 =?us-ascii?Q?nyGYaw6lI3GdGcs7XR4iWgZJnq4uQr/qnjeQ/UV51vJ2WvLlsfveg8RzbMDa?=
 =?us-ascii?Q?eT/+1YCkOlAZMGHdSNtBsO2BEvelxd0BLQrHmpFT6c4vByd0pWL1OfteKnAp?=
 =?us-ascii?Q?Rj0VR3N9LOWDL7Fkf2/7tZKsCDSqQXvvWCvovUSgi7H29OVpSQaiWa7iZn4E?=
 =?us-ascii?Q?BFbQGnf6kp/SlLkJa6MIWAKHNI+aNGdF+Il+ozf5XvSh7P0zu+zbYxWRJOHa?=
 =?us-ascii?Q?lVYkSrkHqifiszV8ixVAk2HrNoTYlAx9AjBvSgjHGn45aA5UYdfO3mPIu/Lp?=
 =?us-ascii?Q?Mfi2bRB5RXS3Es2NbDpNREEa6os+xpiiqTC/hzSx3MDhQWVMqTd66ywAQVEq?=
 =?us-ascii?Q?o//ROjHdvV9obniT+V6dqnhQkIKySMVbdpQH36doSypQdEMrrSez6ISIcoa1?=
 =?us-ascii?Q?7Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4086924a-add3-45fc-42d6-08dcd35de0eb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 19:05:34.1241 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z6KSkoefqKW9q8hXFvDxTUiaFwIN+FE26nowQKjP93QIpK+MskshJDxOinluHgDYKpL1EC8jukdJI9ud45gzkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8759
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

The pci state was saved, but not restored. Restore
right after the power state transition request like
every other driver.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 5ba4ec229494..6d29ef4b396f 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -949,6 +949,8 @@ static int xe_pci_resume(struct device *dev)
 	if (err)
 		return err;
 
+	pci_restore_state(pdev);
+
 	err = pci_enable_device(pdev);
 	if (err)
 		return err;
-- 
2.46.0

