Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD231C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 00:34:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A25DF10E367;
	Wed,  8 Nov 2023 00:34:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 557DA10E367
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 00:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699403693; x=1730939693;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=y1O6o40R9hShGhJwu4s8Ch/4P5u2i5z7uKx7HchlK3Q=;
 b=nis6g6b3QGgZif7vZm/7fz1eaOwAG/cGMEIaoAdjLG9O4ShXnkPTXJl+
 6TqthPPcSFyvBADEfYaBFslroRz9qc5Rrm2eOePx4fju6/a6VejsX5VeO
 yXrLkeCAKF9o8+6crLmllay6evNHt9ODBS0XmYgEEnVquLxmArHyt4Mkj
 QUgUs5aHpBJq9xko79xYkdkEnNlDH3V9dKjbju7GZhwa/HzdRRoI28VzS
 ZcAX5V/MEZRjLzApyAakTrtZgjc48VUVw7UkUfddO1pOtwSOoARL37Amf
 0MdbhhCaocGuk5b98PTjtXyycrHrlPxFsebVRMJwceDZoDbGVgoNr1hvR g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="368991809"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; d="scan'208";a="368991809"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 16:34:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="762889667"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; d="scan'208";a="762889667"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2023 16:34:52 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 16:34:52 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 7 Nov 2023 16:34:52 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 7 Nov 2023 16:34:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YKSCqp2VrQoMyn2zeXY3UpfU8ZANwz5KuWLyQRiCKCni0yCTGaLf9Ftp0qLEHqjOrQDr7DqcLeGM/ud0F2nUM4sMDpmU6CzAx3HSJTV4HpbBB++PIigLwe544qjsm1mZ2p1jS0XKS3jP8DhQ0426QF8q4IfR7/nda1mDSDddKt+PcznoZIGZa/uGAb5pmD5D1NC/VUsfy3M09G/pDP80t2RqL/py1a7wOoiknc8+XFcT9hGbCaRzJNO8MaFI5itRly7HK9uUYXVN/LSxKztUizX+NeetP25wDUQ+7GoMUyQ5OI+M186ENo3jb1j1nmFcakfAttTdXx8KAlhIShPzqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7VrgflixeBv3d1X2enF46fjnSvZVVdd/lZD0Fbokm8w=;
 b=LwlwCXtgukycWxRQ6DmCcbx8lsxh1rwmIUG9lpFo+kBCLESGIEqVnebZXVgNf+GlIzTM3EpNB3gAX7Hm849JOlLyv+wZWM/6wJ0C0Qd+a/5AqkniG7CDZk2btlzdPzROo6PoOr5e6YRMlj9gSurPLdkLaDtxuFma5jVnNPzlbI7VsZrvcw1MrUn9hhWYc03G5ISjZOk3aRyV7qGvliOcbDKe4v4s05y6sJqPg7HfthSa0mNzjkUUxV75kzfpNZGXbocF3z9tto0g+fnu/2fhvIbDCoLfZwGzM+lKDot7ttuO3I2VPKVs9EDb63vqRWTs+LeuRAf3gryOo9oR+VEo6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB6802.namprd11.prod.outlook.com (2603:10b6:510:1ca::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 00:34:50 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::760b:d339:54e1:27bb]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::760b:d339:54e1:27bb%4]) with mapi id 15.20.6954.028; Wed, 8 Nov 2023
 00:34:50 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 8 Nov 2023 01:33:43 +0100
Message-ID: <20231108003344.1169016-12-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231108003344.1169016-1-michal.winiarski@intel.com>
References: <20231108003344.1169016-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR09CA0120.eurprd09.prod.outlook.com
 (2603:10a6:803:78::43) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB6802:EE_
X-MS-Office365-Filtering-Correlation-Id: db4cf6cf-06de-4aa1-edd3-08dbdff28463
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n0YiST/f9yN+ZyzPu8fFC/FjElWRE4L7uc44D4fG85IoRHgjvH5KQPlHL8pJe4l+/6tkdPx+KQDlJ4NEYI7FA0eTGujdeV/cQZd2Sw1wp1SISqjuW9uz04tNq6Q0Ck0Mgh2x8GX+oebA/0IwkKNyqrMYarKXf0GRYdvJA6M86IIXlfNO1/8wXgqpNO2NWP/Pvtcvz10mpsC6fg8Q+/BifVIvDLT9k/mTr7VHfk1vwj6vZw7NMVvH16wu24HHVyMdSg2im3q//V7/jsa2vs2RD/oN1xmIUgN1957XMogZX89E3+G93cDzxyA4+VfW+mz0LwAt1RZ6fiS/91cSkgyFz2dCUdkXmGpq7Tb4KDQSKLpMV/+gdM/faVMNzSZN33nRWAtFVllyAuNYGoMy2O933l43wT/L0RVRiU53bL1thqcPQPErcXkEvuo5xIoMKcCVbIGasjH/4bdqNuvnnzEHFcpUdjBr8vSrh8PBQ25rjrZS1rsESkRyZtbFYvCeFNM1vcp5ZfVu1G4+TVP1RGQVNxscLhWbRQTfIgU6WDRG9C7yQIa1XApFiJrPGWvvjggb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(366004)(39860400002)(346002)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6916009)(6666004)(8676002)(8936002)(4326008)(82960400001)(2616005)(6506007)(6512007)(5660300002)(41300700001)(107886003)(6486002)(1076003)(2906002)(83380400001)(26005)(478600001)(66476007)(38100700002)(66556008)(316002)(66946007)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFprQkZQQllReDE2b0hTWjl1ZHR1WkRIelAvOTh3ZnJBMHNOZFdaQkhxUzVz?=
 =?utf-8?B?SmxFUzMwNkMvN0hTdHY0NmZsN1diMlZjSVljQ2Jaa2lORm42R0xta294dmdJ?=
 =?utf-8?B?Vjg5QjZ1VkVXeWdtb3lOZGFSWnYvODhiL2JDaFJvS004RG5aK3I1eXozK3dt?=
 =?utf-8?B?TktreWp2eGNiazFVQ3FOOStoNUJlcjhaMjZJT0xLTWRMR2l6dnFwWWJqUmtM?=
 =?utf-8?B?TlhzZWhMa0xnVHFPTkxPRmhDcmxUV3J4TlBxS3V6cE1BKzMwY2dodmUxK2Vl?=
 =?utf-8?B?cEUxNCsyOUxud0w1Ym5nS0Z3UHNoa3JRODRGUTkvSGhBMFRqbUFCUUVxWFZh?=
 =?utf-8?B?eHRzY3djVlpjVE15Z29JZ3Vtb3kzVVJ3UGNhSDlnZDVPbWxiWngvZmo5VzMz?=
 =?utf-8?B?RFQ0YU14a3pHeFNKSUJIZEU3YU56alBRazRyeHJOZ2p1STNRNGZ4YVhQZ3k3?=
 =?utf-8?B?cmg2cjFvOTVWTFpXUVVlSWsySyt2OFN1bXJWNE1kSlkrNjU1OFJXMTQ2ZzFL?=
 =?utf-8?B?WnAzTnpwSEkySVVNWjVMckIwR0V2NnpKSnY1dG0raWREeTFraElWak1VWEFq?=
 =?utf-8?B?TXF2OFJCNlU3MkJlT04xQm83bU01TUJuSTBySUdsTmhlTitiRlRmenNPNzF5?=
 =?utf-8?B?ckFWNzVWRTBKVjgrODV3dXhyamVuSENsRGdWdzFHV0gzZUtDWTBZRFhwcml6?=
 =?utf-8?B?ZVd4QWNLRnlNWGRLQVUwcU1rbVZDRTNZWDhjS0p6WWFJZUZ1YjFSd29yQ1l2?=
 =?utf-8?B?b05UK1UzVEVvc1VvNi9vWVhydFNNSVpGZWlkVWtYMHhTd29KMkp1TjNzTGhp?=
 =?utf-8?B?aEh2WjNiZEpabWRHNTJaK3RTUmsrRDlOSXZPTHBJMlQ3cHRDdkhkdk1BZ28z?=
 =?utf-8?B?VXJnakRTL0NWNDhCd3lXN0M1ZWJuL2VQR3ZNSVVkb1o4NEoxMUd2YmNTbmds?=
 =?utf-8?B?ekhjRDh2bW50UVZkenBoL2xjc1lNSjNKK1JvaklKRTZLWnNoNkZKWEdoVUlv?=
 =?utf-8?B?ZTlISTlzNHQzQWhmNkFrNmR5VlA4MU5zTFFoeGxCR2UwRWJudDBsVDQ3UEFj?=
 =?utf-8?B?RzF3KzMwMEpseUFxVUljQjl6dXlOQ1hmdUV0ZWhkZ2RFemEzbkJOaVBuZ2sr?=
 =?utf-8?B?UHRjSmYvQzRHK3JnbnEzcndqc0pjZzAzME05M2p5ckVJa3VOQ01wa1BiNll5?=
 =?utf-8?B?Q0U1V3V4T1dvSndYM1hHN0xNMWRsRm9MTjB2bUlLeHI3RmNUc2k5cWFIZDhR?=
 =?utf-8?B?ZUZ3RTZQalR2T1lwRkV0b0NBY3Y2Qkl2WXlvSnduL0NNYkpFWFJ0MnV0Yyt3?=
 =?utf-8?B?VThtWEJBYkVXaXBCNW55OVRuZzdpZG4xaVhjSjlibmNKMlJvU0ZReHExbVB1?=
 =?utf-8?B?cHJaQTNTTElmdzZacmt5MldlL0dic3R3cCtPa2VKK0k2R1laUWt4WUFBb3Ny?=
 =?utf-8?B?N0NjZkpJa0dJa1JJV0NIcHpUdXQwOGdQbUU4bTk3QXBSTGViS085cS81V3J6?=
 =?utf-8?B?em80YzhmVDdScjNLZWFBUzcyRVpLMytZdGFlbk14b3M0UGtpcDRlRTl0OHIy?=
 =?utf-8?B?MmExaFNKU0dVdFIyQUllSUw3VTJja0JPMWhuMDRQWDVqc0dUVzhEZTl4eUZu?=
 =?utf-8?B?a08wMmhwN3FiMnJVb01SQmI0OGU3d0IwZHFFdy9vYkZCV3NKNU1zMGNzaGxz?=
 =?utf-8?B?UkRuY0l2cUgxU2xrMmJRZDZVdFprVGJUUm1uRXk4S2w5VWJQY2xOdVFtT1Va?=
 =?utf-8?B?b1hZT1FubDM5TFlvVW13LzVvQVhuNytYMW9TZHBtYldIR2xLNjNLci9OREZ5?=
 =?utf-8?B?NmRCRGtDQmVUa2w1QjhNbGF5clJxVUFVS0xzQitKdHI4Unl6RU9vdnQ4cTRu?=
 =?utf-8?B?aHh6bHdjZ2RPUnBaQmNRQ085cTlDL2pNRjFUR0I4VmlGSWdCU2JOcHBTUlZ4?=
 =?utf-8?B?RzQ0ME9uVnlHcWFEVXJXTysyNW5rS3NiSEhXNENXZ09Fd29yUStuVWRqeFFX?=
 =?utf-8?B?NUVWQlN0WlQvTERzVzIzNmxCaE9uT1QrRk0wcWtNSkNjclpPdGs3QytHbUVY?=
 =?utf-8?B?YXEybVdDeFpjalJCUEVMTHc3ZFNpR2JnRlkxRUxBYmZGNGdKbDl2b2gxT0tj?=
 =?utf-8?B?SFRTZysvRWFzcVJsTG1GMHRleDd1SnBXTWk3RXJtbzV6bnlGbWQ4aDR6WkVr?=
 =?utf-8?B?a1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db4cf6cf-06de-4aa1-edd3-08dbdff28463
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 00:34:50.0483 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +84/ncG3TNdikO+bOe43vY/9nQXlAW741HAJVooBkw0hlbpiWkwdjl5F905SEgDjPjextQj0FHhNx2n6h7aZFI9JWBn6gG/hR+qTIbgD4wA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6802
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 11/12] drm/xe/device: Introduce
 xe_device_probe_early
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

SR-IOV VF doesn't have access to MMIO registers used to determine
graphics/media ID. It can however communicate with GuC.
Introduce xe_device_probe_early, which will eventually initialize enough
hardware to allow the driver to communicate with GuC early during probe.
This will allow both VF and PF/native driver to have unified probe
ordering.
Initialize root tile MMIO and TTM sys mgr early, as both are needed to
communicate with GuC firmware earlier during probe.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c |  1 +
 drivers/gpu/drm/xe/xe_device.c    | 21 +++++++++++++++------
 drivers/gpu/drm/xe/xe_device.h    |  5 +++++
 drivers/gpu/drm/xe/xe_mmio.c      | 17 +++++++++--------
 drivers/gpu/drm/xe/xe_mmio.h      |  1 +
 drivers/gpu/drm/xe/xe_pci.c       | 26 +++++++++++++++++++++-----
 6 files changed, 52 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index a40879da2fbe1..733df9a270db2 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -143,6 +143,7 @@ int xe_pci_fake_device_init(struct xe_device *xe, enum xe_platform platform,
 		return -ENODEV;
 
 done:
+	xe_info_init_early(xe, desc, subplatform_desc);
 	xe_info_init(xe, desc, subplatform_desc);
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 696f997bd2c93..19faddb779808 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -364,6 +364,21 @@ static int xe_set_dma_info(struct xe_device *xe)
 	return err;
 }
 
+int xe_device_probe_early(struct xe_device *xe)
+{
+	int err;
+
+	err = xe_mmio_init(xe);
+	if (err)
+		return err;
+
+	xe_mmio_root_tile_init(xe);
+
+	xe_ttm_sys_mgr_init(xe);
+
+	return 0;
+}
+
 int xe_device_probe(struct xe_device *xe)
 {
 	struct xe_tile *tile;
@@ -382,10 +397,6 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
-	err = xe_mmio_init(xe);
-	if (err)
-		return err;
-
 	xe_mmio_probe_tiles(xe);
 
 	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
@@ -418,8 +429,6 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_irq_shutdown;
 
-	xe_ttm_sys_mgr_init(xe);
-
 	for_each_tile(tile, xe, id) {
 		err = xe_tile_init_noalloc(tile);
 		if (err)
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index ee89af6b1ea9c..5d7fd16f545c6 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -37,6 +37,7 @@ static inline struct xe_device *ttm_to_xe_device(struct ttm_device *ttm)
 
 struct xe_device *xe_device_create(struct pci_dev *pdev,
 				   const struct pci_device_id *ent);
+int xe_device_probe_early(struct xe_device *xe);
 int xe_device_probe(struct xe_device *xe);
 void xe_device_remove(struct xe_device *xe);
 
@@ -122,6 +123,10 @@ static inline bool xe_device_uc_enabled(struct xe_device *xe)
 	for ((id__) = 0; (id__) < (xe__)->info.tile_count; (id__)++) \
 		for_each_if((tile__) = &(xe__)->tiles[(id__)])
 
+#define for_each_remote_tile(tile__, xe__, id__) \
+	for ((id__) = 1; (id__) < (xe__)->info.tile_count; (id__)++) \
+		for_each_if((tile__) = &(xe__)->tiles[(id__)])
+
 /*
  * FIXME: This only works for now since multi-tile and standalone media
  * happen to be mutually exclusive.  Future platforms may change this...
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 8945c601e1c54..526a6ac6be56a 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -15,10 +15,12 @@
 #include "regs/xe_regs.h"
 #include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_ggtt.h"
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
 #include "xe_macros.h"
 #include "xe_module.h"
+#include "xe_tile.h"
 
 #define XEHP_MTCFG_ADDR		XE_REG(0x101800)
 #define TILE_COUNT		REG_GENMASK(15, 8)
@@ -369,10 +371,8 @@ static void mmio_fini(struct drm_device *drm, void *arg)
 
 int xe_mmio_init(struct xe_device *xe)
 {
-	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	const int mmio_bar = 0;
-	int err;
 
 	/*
 	 * Map the entire BAR.
@@ -386,15 +386,16 @@ int xe_mmio_init(struct xe_device *xe)
 		return -EIO;
 	}
 
-	err = drmm_add_action_or_reset(&xe->drm, mmio_fini, xe);
-	if (err)
-		return err;
+	return drmm_add_action_or_reset(&xe->drm, mmio_fini, xe);
+}
+
+void xe_mmio_root_tile_init(struct xe_device *xe)
+{
+	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
 
 	/* Setup first tile; other tiles (if present) will be setup later. */
-	root_tile->mmio.size = xe->mmio.size;
+	root_tile->mmio.size = SZ_16M;
 	root_tile->mmio.regs = xe->mmio.regs;
-
-	return 0;
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index 9f1a25cfd2cf0..894a792ac8abe 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -21,6 +21,7 @@ struct xe_device;
 #define GEN12_LMEM_BAR		2
 
 int xe_mmio_init(struct xe_device *xe);
+void xe_mmio_root_tile_init(struct xe_device *xe);
 void xe_mmio_probe_tiles(struct xe_device *xe);
 
 static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 87c45c6e08aec..2f04f07dc17a4 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -532,10 +532,12 @@ static void handle_gmdid(struct xe_device *xe,
 	}
 }
 
-static void xe_info_init_early(struct xe_device *xe,
-			       const struct xe_device_desc *desc,
-			       const struct xe_subplatform_desc *subplatform_desc)
+static int xe_info_init_early(struct xe_device *xe,
+			      const struct xe_device_desc *desc,
+			      const struct xe_subplatform_desc *subplatform_desc)
 {
+	int err;
+
 	xe->info.platform = desc->platform;
 	xe->info.subplatform = subplatform_desc ?
 		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
@@ -549,6 +551,12 @@ static void xe_info_init_early(struct xe_device *xe,
 	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
 				  enable_display &&
 				  desc->has_display;
+
+	err = xe_tile_init_early(xe_device_get_root_tile(xe), xe, 0);
+	if (err)
+		return err;
+
+	return 0;
 }
 
 static int xe_info_init(struct xe_device *xe,
@@ -611,13 +619,15 @@ static int xe_info_init(struct xe_device *xe,
 	 */
 	xe->info.tile_count = 1 + graphics_desc->max_remote_tiles;
 
-	for_each_tile(tile, xe, id) {
+	for_each_remote_tile(tile, xe, id) {
 		int err;
 
 		err = xe_tile_init_early(tile, xe, id);
 		if (err)
 			return err;
+	}
 
+	for_each_tile(tile, xe, id) {
 		gt = tile->primary_gt;
 		gt->info.id = xe->info.gt_count++;
 		gt->info.type = XE_GT_TYPE_MAIN;
@@ -717,7 +727,13 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	pci_set_master(pdev);
 	devm_add_action(&pdev->dev, xe_pci_clear_master, pdev);
 
-	xe_info_init_early(xe, desc, subplatform_desc);
+	err = xe_info_init_early(xe, desc, subplatform_desc);
+	if (err)
+		return err;
+
+	err = xe_device_probe_early(xe);
+	if (err)
+		return err;
 
 	err = xe_info_init(xe, desc, subplatform_desc);
 	if (err)
-- 
2.42.0

