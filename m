Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 520DDEB7EB2
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 09:16:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12D6010E989;
	Wed,  4 Mar 2026 09:16:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ULXpOted";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6509C10E989
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Mar 2026 09:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772615774; x=1804151774;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=CWplGHU2tMu6IIF2lo98n7P0M9yTAA5N9kmzjtOTFWI=;
 b=ULXpOtedWxEA3DI+UMKFgtnPe6Uc0h31wxWwMzwON/16zsHoOLY66InL
 uYiLJaOqFCwyUfux/vGnJ/8H8X4o6OulkIDYDn0JmC73Pi05k2JP805EK
 HK56r227fV0zNQmCn6/obGsGo53ujM1p4kar9sgXo0pUPs9IdTEGt79YR
 1lhSnwOd2Twy9edu2ue2PrNb736XVtqJAJCDaRBHtfVoeGL2N2hbm0TD+
 nDUdl+vVp78KoGyzF+z3mFEZXSYt5EqpeN9WL+dxff9dEvNv734Ak0K3R
 Yz3ThBOYUqU37BJJUDMKPf5R+PpYa+R1L2+grFaUXRSWWnLUR/rLQUA0O A==;
X-CSE-ConnectionGUID: iwtE/ABjTiyNzaJZjasv4g==
X-CSE-MsgGUID: 1KqDqmFUSPmN1tqfjDYdfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="96281630"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="96281630"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 01:16:14 -0800
X-CSE-ConnectionGUID: TOf8+61TSfO6H/Q0pGVWeg==
X-CSE-MsgGUID: aPn1XfZNQbW8CAIR0qpoFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="215253801"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 01:16:14 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 01:16:13 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 01:16:13 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.70) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 01:16:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NE+s8fFSynK9+PJs3xsUfo4O34r57RA/vdNntnqwhveXCNttEhzGM1zvb0QfmrH7wR7+Aa+0sFGJf+aEaII04zFArEmB47mLa9PoIgRo+UY/L6iuz4MG8dRac2Hv2XnawgdA+ZgX2b7Q4Xa/Bz/ZJgE8irfVF3w0CnqWo3P8rawmtAIt5lqKihAEBbeFGEMnzxtRLAX3xXRwK6MDgh5Z1//Rr3E/NFFkUyRcuVe7pzGWloEgDq+Jiy0CBwswAAFBPBFmjA2a7eGCMdGhE4wUZD/JCf/57068zem+5WabdO7eRp4sLOr+yAxZULhoIz8OhzVZExRZ3CucZ88q6nq35w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ptLbHFZPErk2BKYs2EUOB4+DGSMR1tyMnHDVaqRuGBU=;
 b=NfVHKUW/15V9pYCwzspVfDOTGKJ8STis8gXp/h5pHdqcMcUO6ZBUX+LMFf9kazGkhrXsiMjd5pMaSlkCMvZV1+xnB4FNvbWuU7S3x9VkMR/jxNR4NklkQovDGPZJzHbKRTla8hviqupnQMB/YwywdsKMxloyYb+YZiOx3aRrR60u6UWzbhoDMwCQG538V9LlKECMMQnFzp0eJUqPFAQkHoaI7Sbt3+3CBRs7/YxUz2VEAbfszs8QHmZ+m1dtlFYieScKuVL97fj8ir+tuR5pdn7Gdw8aWw5zJghzbsk8uNs+YDjpZhTp3YTs7SfCMgVMKAP4s0JSHUoc7Q4sQL1vkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by MW6PR11MB8312.namprd11.prod.outlook.com (2603:10b6:303:242::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Wed, 4 Mar
 2026 09:16:11 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0%6]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 09:16:11 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v1 2/2] vfio/xe: Notify PF about VF FLR in reset_prepare
Date: Wed, 4 Mar 2026 10:15:05 +0100
Message-ID: <20260304091505.732528-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260304091505.732528-1-piotr.piorkowski@intel.com>
References: <20260304091505.732528-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0154.eurprd04.prod.outlook.com
 (2603:10a6:10:2b0::9) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|MW6PR11MB8312:EE_
X-MS-Office365-Filtering-Correlation-Id: bc94ebe4-eea0-4407-9f55-08de79cead4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 2xDMZhEzNePOP1HoIL8xyqI0j9IboiZUyK1nE5k7ajEZkw15yRRr/5mWhO3JuFFL9g4NE9r/JIzeNRYHu/uHE0Y0O0ZDk5dZxQRhXk/9qcvJmOoBV/jK0UuCBaK2/ReRDiwP54yx9jQiD1phZtjqRLPvUchFVozElhuaCMEkwi5nV+cZ6zEY1IjmAhL9Cb3W+jRhaWB6Qfxs5YkgI8GsZR7ikmxxy4Q8A2+eC40YiLLWEo2hdsHwrWee4H9NF4nvyfiB/MyPYtJ0ZJzoxVVdqNivJFaNJ62s9i3w/bR6uYrAtuxNFcBnl2YMUwVhYwy5KCn4S/W7g3o4LDFh2ADq2whjlnY3ojYzjjogpPQZQB18lWIF/C2TMDNVXsM1db9BBmOA6/vvsYYj+ueX5T1RonaS738oclKkxU04nlrLAsO6iwSfp4McRzzh5qFjqG8Y+XfxN5r5QZNalWgEkENUqcuSOw0/9Gop/9oPPOK0Wvgpy/NU5Q0AoZmQL/1Rem4Lms8JjQnVl+Jvy0KQtaxluOd/b+isMWvKeUAzoMX4jo5CDQXm7mlRrq+7DgRKl6LwmQ0P3i8cSepqwfCh7uKBucQeBpYJCph5qfblFUAl4Lx3RJigIgO5Anwr5biErffKQdfwAux+1J7ECmXEjA+SCME9eXfHr/Bk0H98JLsvCpENBSBLmF+XTpG+M8FOnUpqYv0WCg4N0HEbm4dfe8T7DrctxAkCBEifuzeCdfHZs3g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFVoMVZKSi8wVXdaY3orY2xUdHYwa3dFT00xcmMzQU4wSkxaQWVnUWdtV2JZ?=
 =?utf-8?B?bVhCOFNkL1c3Q3Z0YituRC9EMGwxQTQzb3ZRUDNFUnM2Z3FZQmVUdTJCMGNt?=
 =?utf-8?B?VGVMbXl0SGtBYTIxbi9YdlY1Slh2U0pOY2lldWh4MG5GMTMxVG1Za3hBNEpN?=
 =?utf-8?B?Q1BCdGZHWUo2U3FIaFZ4c1BqUHVLYnIybnhrMjEzVWsydmxUOGpNMVpSL3A1?=
 =?utf-8?B?TkxKUHdoa3VCWW9PV1ZDYyt1TXJSVUVzMW5UQkZIZUlMYVpuV3NjSkpnWHJq?=
 =?utf-8?B?QUgyTTh0U0pOTlpHZGxnc2ZkaGljRFdLRHpoRFBpVjMxeHhFdDRMcElsWnF0?=
 =?utf-8?B?S0ZCY09DODEzNXYwOGhjbXNCaEpBajdTMm5OM1dQOFU0Mis5RGZndERlQVpQ?=
 =?utf-8?B?WWFuRXgrMjJXVEtpRkNaa2FqM1VGdG1rNWdEZFlDbHFRL0ZtRnJ6OHdTMGx3?=
 =?utf-8?B?RTJ6WFEyY1VVY3JUWUVPWU55ek54bTZoUDZrTENWaHk1cUlmQkMyOGh4ZVNp?=
 =?utf-8?B?cEkyS2I3enhvV2hKUlRlMXE0QUw4aGJ4a05zUWMxRGlRRUZjc1NubVB1MnpF?=
 =?utf-8?B?NjBlTW14Vm9Sai9oKzRVZW9YZVp4cHlKTGlORkkxM1prWmt0VXJmaVNGWVFW?=
 =?utf-8?B?MW1vdk9xUWt4WlVSa3hRRk9VWGZPODEwK1o0RG1CWDBMZzJYc29wa0JMN1lC?=
 =?utf-8?B?TkU2M1ZSWFZLRUlhNStheGlPOG5mVW5OemhISHFXanZacnRhR1p2NXJsa0cw?=
 =?utf-8?B?ZE11V1ZCWGl1b0pMclRzQkdpcTJENytsbnF0ZC9Dc24vdGhnc3FGNnBLUlF1?=
 =?utf-8?B?ZFdrSG8vNm84eVRLWWdZUU5uelN2ejVHaWRYUFZHaUVuOGRPK2NERmsrNjZp?=
 =?utf-8?B?dC9taVJOTEhqUXY5cW14cnVMT2RmVnEwVEVQYnV0Y2hEQXZOZE5aUFZuaWJS?=
 =?utf-8?B?d2Y4WlFoYnE5YlBkc3NXOGpacEV2eVlQN2N0MG5BRXdJMCs2VHBMVkdUK1A1?=
 =?utf-8?B?K2VpTjRDNVgybEtMcko0Yjg4TXZXNTJwQnRlQnN0dzdoSVFja3Qwc29MRlh2?=
 =?utf-8?B?Sm5YTXBXTzliaGNIUDdBMXlqeFB3NWh1K2UzREJZYm9xZHVGNXlLczlTZkZ1?=
 =?utf-8?B?d29CSjhqbThFNkRZa2FTTTZHSDkwOGJTSWVTNGFiTk9UY2ZLS1UzN1YxaGFv?=
 =?utf-8?B?YU05RERnb3VxT1JhamRqVTlrK01WVDdhRDRHVUNDMUVjU0ptVHFYbUR1Y1R3?=
 =?utf-8?B?MEw2ZkNHWVFtY1hleWljSXkwQ0oxTytLa3RzUi8zQUV4WGZoc0NMWXFyYzVq?=
 =?utf-8?B?MjZGcldhMFZlOTM2MXU5U3Y4MVo2V25pUllzeit5R0JhaGMyWlYzUUllNGZu?=
 =?utf-8?B?UHlRSVRLRjF1b3NHWGZzS0xiWDJjTTQ3eDU3NktlclFwWGxJZUF5bCswVGxw?=
 =?utf-8?B?TU5xWXJSYVZGQWxhNjEvMVkwUGpiaXpmTkhRalY2TjAva3NrbXoyVENWUXhz?=
 =?utf-8?B?QWpCZDJ0ZVBXUmI1eDRsNmVERW04R1NCQ2ZQNXBKWHNtQWN3cThVeS96Njgw?=
 =?utf-8?B?N3hWbjN3LzVnNm9wWFVFbE1IQXptZERpeXJYd0c2T3dpV2JEemxEeWxaUWgy?=
 =?utf-8?B?emRGWXVVVzFaWDg1cjJFOUdyYkYyWFBXcWR1cDNIMk82MUxKbVJheGhxZlhV?=
 =?utf-8?B?YW5qRXV5N01xK3NUZEV6bnh6clpLS2g0Z0hRMkR5MVFQeXlNNmFGTXl4M0Zu?=
 =?utf-8?B?ajFYK21lYTA1ajFtMlFEZ3FjN0MzWmZ5WVJYeTQzejB2dDQ1QWxqeG1KNXd0?=
 =?utf-8?B?a2tqM3ZwWUl2RHlZS1NDazYvalk4WjdZNHBNQWZ2NWxDN0kzRmY4YzczUlhH?=
 =?utf-8?B?OHdyMzY3YjdwMW02a01yckViT2FSZTVuSkxiUmpub2lybnZveXVmL0t2UGMw?=
 =?utf-8?B?UTRSNEVyQ2M2V2dqcjBuSGswUnpNdWdFbTlETHVhRjlzRUN5ci81d2ltS1lM?=
 =?utf-8?B?bDc2ZEduNjFSNmJFdEIvTzFOUDRsMnNRS0ViK2E5djVTVllWTzIvZjZxRGVo?=
 =?utf-8?B?M1ZYQ3NRT1N2V2lqdERTZmhqbW41WG9iSmlGeUpQcTU3VWpVWGVRQlU5Yjcz?=
 =?utf-8?B?bEFZQVZFSWgwcVBZUnRwY2diTjBrb1VsSkU2L05ZbTI1cmdRdmhWeDB5dXV2?=
 =?utf-8?B?VE1Ud0tvZ09KbTlZUUVDWmh5U3g2aUhBTkxXRVNFMlpCNytwSHFIdXNkSjBV?=
 =?utf-8?B?MTJrYVpsdnk4UlZZcTBYYzhXK0lac0ZXUnRYcjhueXJjaHVhcjltRWx2VXl0?=
 =?utf-8?B?NVFnZkV4VjV1aER1aHo3b095ZFFscXJvbkFQQklSUE1obmduV0JoVVAyV25X?=
 =?utf-8?Q?rX8HBTzhrf2o1MHs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc94ebe4-eea0-4407-9f55-08de79cead4d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 09:16:11.2082 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rlYeVjwCuDDrdPTCW2gBLvMHLcqmB+EbRBDry8qvCrmb9iX38uK+szIl9nbxbX/OJCkSqT6LW2h/llcPKGiJmJcFCORnxDy1GLPXD9HKWUM=
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

Hook into the PCI error handler reset_prepare() callback to notify
the PF about an upcoming VF FLR before reset_done() is executed.
This enables early FLR_PREPARE signaling and ensures that the PF is
aware of the reset before the completion wait begins.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/vfio/pci/xe/main.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/vfio/pci/xe/main.c b/drivers/vfio/pci/xe/main.c
index fff95b2d5dde..88acfcf840fc 100644
--- a/drivers/vfio/pci/xe/main.c
+++ b/drivers/vfio/pci/xe/main.c
@@ -85,6 +85,19 @@ static void xe_vfio_pci_state_mutex_unlock(struct xe_vfio_pci_core_device *xe_vd
 	spin_unlock(&xe_vdev->reset_lock);
 }
 
+static void xe_vfio_pci_reset_prepare(struct pci_dev *pdev)
+{
+	struct xe_vfio_pci_core_device *xe_vdev = pci_get_drvdata(pdev);
+	int ret;
+
+	if (!pdev->is_virtfn)
+		return;
+
+	ret = xe_sriov_vfio_flr_prepare(xe_vdev->xe, xe_vdev->vfid);
+	if (ret)
+		dev_err(&pdev->dev, "Failed to prepare FLR: %d\n", ret);
+}
+
 static void xe_vfio_pci_reset_done(struct pci_dev *pdev)
 {
 	struct xe_vfio_pci_core_device *xe_vdev = pci_get_drvdata(pdev);
@@ -127,6 +140,7 @@ static void xe_vfio_pci_reset_done(struct pci_dev *pdev)
 }
 
 static const struct pci_error_handlers xe_vfio_pci_err_handlers = {
+	.reset_prepare = xe_vfio_pci_reset_prepare,
 	.reset_done = xe_vfio_pci_reset_done,
 	.error_detected = vfio_pci_core_aer_err_detected,
 };
-- 
2.34.1

