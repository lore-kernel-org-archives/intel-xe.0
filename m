Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A23AC46CA0
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 22:36:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E42CC10E699;
	Wed, 29 Nov 2023 22:36:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51DF610E6A3
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 22:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701297362; x=1732833362;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=gzbPFZLrqHB8s6OqWVXHas+ZR/Pcu09dWgnNNugjO+g=;
 b=E+OYGUVT9JKncqU6L4cpakVXG1AG/GoPuxf8oDoxi/+dWHWH71dFI6Kn
 7igjFokHO3dH5S4O/u1pAMaAauPkWoOpMsl/VGcoGm5qa91Yf0nb2AqBL
 BnnYq3VAmg1UGQYrvsGr1hSfJoYLznakv8y74ATgIyx6rEmaJ0iAWyoTV
 kfhmrLJIEJ3rgtj+jrpKFrbmBl9nx+h/k0SWLvGiSrErREALPV+/9J1Wr
 dKuVySEg7fChf8bTOa+ThFLZN5JPRQcLq0vKxe1ep5InrIsKfqm2/I1XO
 0Cof/WxvSwpcywKutPAv1TzyfMAMGYUknEqIyB78pRwsz/YkNWlxi8Q4x Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="219741"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="219741"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 14:36:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="745418098"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="745418098"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 14:36:02 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 14:36:01 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 14:36:01 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 14:36:01 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 14:36:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UVT8rKiThaP2gBfVYuUlIk/pUcuzal2iDB9qgiDtzi2xhlmmB9tcMhCE6GP27zwjZFEr6dytfwBxjyN4hw0zrTrBun6K0Q0xLIfbrEmMheLSH0ypUAHU2SCFm42yYU5i2ZSuOQec6SGR4zBeYrxz6tYJTBwizLKV46ID2qq3nZ/Sxfjp8Te8itOlwO1LN1meszvYknXlfMbdWDiSTSqOWjc2irfynXS+2SHpcd41po7nfVpHA/dNpAiqDHsFOu9s1Gu+9Ftg+IxvKxlnHYUA3VIk3fUnbHA6PfT0c5nlYH0lklWCOt2CZ3FxRal4PrzpyRcrA8lgTpbXVt+fRCC6Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7GrGGww0vIWLOF27J4gZpiNWNsO6w3YXoTpj7dfpZlY=;
 b=odHo4PrfgG0sR7TlJtdcHYVN/rJQuHLySDDLYllpUGZC/cXn1WhgrPAXN0PJ6SsFktZ8m3YzjOXXgwJOmCZt6nBnOcp//U2Qt0YCLmIpHrhWFc2d/SK+nWWHOfVNY7qThwJtsg2juLT1f5/Cxmnu6lFgIDQiauFthC2Xt/pQMYOOunW0oZqevTufBBxP4CWi5Ty0r1R0EaCeEiYr0xhG84FS7MgFQPTSQGA8Pb8g5+mMfjNyf6XOfaGMJEgH9zIKsiGiIIU5Cba8IR/79d/K2/pG0g81/K19ETgoIgdKxapdFq6/rMUuUd+I+cLarorHV/Q+G1b8IbO6CET1hFktUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CY8PR11MB6962.namprd11.prod.outlook.com (2603:10b6:930:59::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.23; Wed, 29 Nov 2023 22:35:57 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 22:35:57 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 23:34:54 +0100
Message-ID: <20231129223508.1189461-10-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129223508.1189461-1-michal.winiarski@intel.com>
References: <20231129223508.1189461-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::9) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CY8PR11MB6962:EE_
X-MS-Office365-Filtering-Correlation-Id: 18475431-b147-4742-7f76-08dbf12b8e3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7uHf8yyT6K92r7dCtE38vmnvjE/t63M346bOFLwSD239x5cqNGw/fulamH2N4x0rxEHzxcs+k59NM2OX/avRPae+fnO4Tto+r2Mw+KvO/WcXgTEk4qhL3ftSvMUnvd8BsyQ5McrE84a5HS8+aQMSG7/fGf6HL87U/kIBV7ddmz3qB/+DDwRpw4rw5bopuucf1f9M0GIv1gk6zCH6oUr4+yGi8KQScdz8feBx4BK3/cZE/erMuRz68g84g/+EZfYQg5vPT0ibQINDrZGcudd9i+lDE0AJQHmchg9K99rAR35D5dvkHWg6u0ciw5gQfYgJVKvJO9WtD6QAnnDykqg+faUupYydyv9drQSprTiDnYvlKXD74M1K7g/UdeyI05ra3mp9KD/pkTYTzKyQvUvYDQSojMONvtW2S7GRVncRG5miI022y3fpih718kwXDP8Jk7iFkG/qsVyGneIl9chmN3JT+AhvVDorQIrmLSFVbx4HYB4cijERRabtM8MqeVdK8Yj3eLxKVZDEPJngdn5E/E2M/8UCTQ7OMSPY3azAKDVTVstRLNH4esNEhPDXBo0Osy8o4JcjnVrKpRfDY0ttW0pimENtjEAfxZhGHXZf2prO4jJyimHZL4Rag5XrKae+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(346002)(396003)(39860400002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(83380400001)(26005)(2616005)(1076003)(66556008)(54906003)(66946007)(316002)(6916009)(2906002)(5660300002)(4326008)(8676002)(8936002)(86362001)(66476007)(6506007)(41300700001)(36756003)(6666004)(6512007)(478600001)(6486002)(82960400001)(38100700002)(202311291699003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mi90L2FBKytNY053V21WY3AvZHVFQ3h6QmwwaGlOeUhldHZPZEFkT0ZLUGxJ?=
 =?utf-8?B?VFVud3RWQ055YXhvTmNSdTZ4UHBsb2x6czlPOUJMd04ydHZNVSt0UXF4Y1Fq?=
 =?utf-8?B?ZTl0aU9aTnBoV1FGdTNNUkJXUVJjTHlFeGFmb3RneWhDRjFtMDRBeDlUR1Rl?=
 =?utf-8?B?dnp1OURUTUJ2eTFFTHN4Rk44QmN5ZG9yMHIwUXRWU2k3MGlJWUZkcTFHazRa?=
 =?utf-8?B?N1g2Q1R2NDFDa3pWN1BFM1RWSmZaZzBFbVZ4Tm5qRmdnYWQvRVpoN0pmUjd1?=
 =?utf-8?B?cWwvTnpjUjdTTnhWaWtSOC9SMWYzUkI4MHlGeDZQOTdtYUcrT1pxVGtXNGRy?=
 =?utf-8?B?SlJNUVFIVmFBbGwvcFhYRlN4UFVmWlp1Z1hwTVZJaVZJQUNKTkJNRmZtUUJP?=
 =?utf-8?B?ME9OZTJPU2UwYlB0YmY3Ni82Ty9hcGFCRmtwK2xBTUE4UXhySkJ5cmRVZS9r?=
 =?utf-8?B?YVlLN1loQ1ZmejZKbGJYVnd6VStHTWdHZjIwVWs4RUtJM2pFQUJBWFlZQ1Ni?=
 =?utf-8?B?TUExcWpoeVBGT09hUFIzVS9tZ0dCVVgrcHRLTVgvcDZteXhSNGVpOUtHbjFR?=
 =?utf-8?B?TGg4SVllRCtKZkhhTmg0QnlZL1FTK3FESVVrNlQvb3VDWGRwU3hYVGptaEI2?=
 =?utf-8?B?S1hWMzVnRWpwa2pkVjI4MXViN2hHNFhFcGF2OEZqZHB5a01yV3VrcTZta0RG?=
 =?utf-8?B?TTd0L3JUZVBkSm1zZzFKY0h5VFU3eWU0bEpueEZHU2NTYmhXNElzM2RTcFVl?=
 =?utf-8?B?R1NBV2VRQnlweWEvUmp3c3dmUWF5dE9MMVFpYXRrQng0cUFYTGFqZ3YvQ3JW?=
 =?utf-8?B?ekJPcE9xcFlzZGs3WTEwOTZNRnFzcW54cWk3d0Z5Z1BGUzJTTmNOVDY4dzV3?=
 =?utf-8?B?eXhpeFNVZWdRaHdtM3hUQUYrWWs0ZVhmR1MrYnJ2b1V5eHRXMW4yOFE4U1By?=
 =?utf-8?B?TUpaT3R6ditBWjJiNE1DaGMxOFdCM2lvc3ZWOFJxNzB4VjZia3JaZFVBaTFK?=
 =?utf-8?B?bDdRWWRqMUtWNGYxU1dpNFFUTGgrRm1JNHhLcldGSkpic0tDT0wzM2N0NVNm?=
 =?utf-8?B?SFJwdkFScnJERGtTeXd2VFRPUHBoZGVHcEJjUFJ2YmpHcy9FZUF1MTY0aGZy?=
 =?utf-8?B?OTZEOGZ4T2Yrc2RlOTgzaVlxYlZaYlMxbTZ1cTBTaWFwNENWUldBVVJXNUF4?=
 =?utf-8?B?Y3JlY25OQVJBbTFtQklMY2ZRaWJTaHpTWDdwV3dFWjBPbCtSNHA0ai9SOHhj?=
 =?utf-8?B?dXgreGNoVkcwU1ZVQzgrS05zZDJkOCtJS2M3RDl5MXRTN2FPVUJ5andjbUEr?=
 =?utf-8?B?b0NDYSsybmJsT2dRcTVMNzdIcTM4SjNtZVhmQ2ppczlJb1FGQkpPWDRodG03?=
 =?utf-8?B?RTY1R1hpWnQ0c1YvK3RZOTc0Z2pYcTZOYzNEM3hLeGNZeVo3QmI4U25PWXpk?=
 =?utf-8?B?MzgwMnJaSkJLQlQvNmo1MzkzZ2dSSVNDRHpNbmg4dCs1Znd5OWxUQVkyMGVM?=
 =?utf-8?B?MzJzM3l0Qm1UaHJxWXVlQ29EM2VyUGRFZW13K1JmRHV2MnBPZXhLc2JrenVD?=
 =?utf-8?B?eDd2aVhWdU9HWjZCVWxTREhDUFhCQldNUHlwemJXUldtL1hXY1FNKzh1ckQr?=
 =?utf-8?B?OFpicHZmYWZUWEQ0L3NkUWVTZVVReWt3K2E0U2V6NHFXeTh6T3VzVTBCVUlB?=
 =?utf-8?B?c0VMaWw1Zk00Vkc0ZlQ2UWNLZEdQSVdueWxnZGJPdHBQb3JwazFmTW1tUEhW?=
 =?utf-8?B?VU55U3lHK2cwUFYvSE9tRktYaDR6UHU5WithWUNKdm9NcWRoVHp0OEkwYkYw?=
 =?utf-8?B?U2NLYmJYSjNUeE5LOHBHY3RUT0VJSklMUGZRYzVnNThNWWZZVDhqZitJZ2xq?=
 =?utf-8?B?MU00MWtwOUN4dmhKRzVaR2dlTlNqWnkwZ2t6WC9lMGk0Y1VMQzBkZzFXcVFY?=
 =?utf-8?B?cEs0Z0ozenVWd0pQbUlvSG9WbjdudG82cUN4VlB2VXZRdDJyc2NPVzIzZUhv?=
 =?utf-8?B?bUJQVTNndHlTWGRsVmZSTUs0eVZYVUh3eUUzWFJKVmt4UEVNVjQwS3hkVXMx?=
 =?utf-8?B?U2NJTkw2c25JTTJjL3RobGd2ODJPOVJMdFAvZE1lUkM2UHZYcC9DWUVBSXpJ?=
 =?utf-8?B?ZWdaOEZJcTA1RXBsbmRXQTIzWGUyQ1drR0dQM2VkdDhtWWJxWEhQdHh2dWZn?=
 =?utf-8?B?V3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 18475431-b147-4742-7f76-08dbf12b8e3d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 22:35:57.6356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wbazU1YlUbvqXoqvnNcLtdSh645A50mhVIB0xHGbQB796VbP4QHhUafjNc87zemEJ9+UEh+75rJB+GXxl74C84sC0907ZyYK8TCwVjpgfdE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6962
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v5 09/23] drm/xe/device: Introduce
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

SR-IOV VF doesn't have access to MMIO registers used to determine
graphics/media ID. It can however communicate with GuC.
Introduce xe_device_probe_early, which initializes enough HW to use
MMIO GuC communication.
This will allow both VF and PF/native driver to have unified probe
ordering.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
v1 -> v2:
- Add comment to "early" variant (Lucas)
 
 drivers/gpu/drm/xe/xe_device.c | 22 ++++++++++++++++++----
 drivers/gpu/drm/xe/xe_device.h |  5 +++++
 drivers/gpu/drm/xe/xe_mmio.c   | 16 ++++++++++------
 drivers/gpu/drm/xe/xe_mmio.h   |  1 +
 drivers/gpu/drm/xe/xe_pci.c    | 26 +++++++++++++++++++++-----
 5 files changed, 55 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 5e1f73c8c77ad..f4be4b13a506e 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -375,6 +375,24 @@ static int xe_set_dma_info(struct xe_device *xe)
 	return err;
 }
 
+/*
+ * Initialize MMIO resources that don't require any knowledge about tile count.
+ */
+int xe_device_probe_early(struct xe_device *xe)
+{
+	int err;
+
+	err = xe_mmio_init(xe);
+	if (err)
+		return err;
+
+	err = xe_mmio_root_tile_init(xe);
+	if (err)
+		return err;
+
+	return 0;
+}
+
 int xe_device_probe(struct xe_device *xe)
 {
 	struct xe_tile *tile;
@@ -393,10 +411,6 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
-	err = xe_mmio_init(xe);
-	if (err)
-		return err;
-
 	xe_mmio_probe_tiles(xe);
 
 	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 54694f98c91a2..3da83b2332063 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -37,6 +37,7 @@ static inline struct xe_device *ttm_to_xe_device(struct ttm_device *ttm)
 
 struct xe_device *xe_device_create(struct pci_dev *pdev,
 				   const struct pci_device_id *ent);
+int xe_device_probe_early(struct xe_device *xe);
 int xe_device_probe(struct xe_device *xe);
 void xe_device_remove(struct xe_device *xe);
 void xe_device_shutdown(struct xe_device *xe);
@@ -123,6 +124,10 @@ static inline bool xe_device_uc_enabled(struct xe_device *xe)
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
index d1b59021c9712..6148c9da4f64e 100644
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
@@ -376,10 +378,8 @@ static int xe_verify_lmem_ready(struct xe_device *xe)
 
 int xe_mmio_init(struct xe_device *xe)
 {
-	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	const int mmio_bar = 0;
-	int err;
 
 	/*
 	 * Map the entire BAR.
@@ -393,12 +393,16 @@ int xe_mmio_init(struct xe_device *xe)
 		return -EIO;
 	}
 
-	err = drmm_add_action_or_reset(&xe->drm, mmio_fini, xe);
-	if (err)
-		return err;
+	return drmm_add_action_or_reset(&xe->drm, mmio_fini, xe);
+}
+
+int xe_mmio_root_tile_init(struct xe_device *xe)
+{
+	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
+	int err;
 
 	/* Setup first tile; other tiles (if present) will be setup later. */
-	root_tile->mmio.size = xe->mmio.size;
+	root_tile->mmio.size = SZ_16M;
 	root_tile->mmio.regs = xe->mmio.regs;
 
 	err = xe_verify_lmem_ready(xe);
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index c054c27f6925d..98de5c13c89ba 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -21,6 +21,7 @@ struct xe_device;
 #define LMEM_BAR		2
 
 int xe_mmio_init(struct xe_device *xe);
+int xe_mmio_root_tile_init(struct xe_device *xe);
 void xe_mmio_probe_tiles(struct xe_device *xe);
 
 static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index d9a3b20179cc2..889f60fa2e7cf 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -540,10 +540,12 @@ static void handle_gmdid(struct xe_device *xe,
  * Initialize device info content that only depends on static driver_data passed to the driver at
  * probe time from PCI ID table.
  */
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
@@ -558,6 +560,12 @@ static void xe_info_init_early(struct xe_device *xe,
 	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
 				  xe_modparam.enable_display &&
 				  desc->has_display;
+
+	err = xe_tile_init_early(xe_device_get_root_tile(xe), xe, 0);
+	if (err)
+		return err;
+
+	return 0;
 }
 
 /*
@@ -626,13 +634,15 @@ static int xe_info_init(struct xe_device *xe,
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
@@ -726,10 +736,16 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	pci_set_master(pdev);
 
-	xe_info_init_early(xe, desc, subplatform_desc);
+	err = xe_info_init_early(xe, desc, subplatform_desc);
+	if (err)
+		return err;
 
 	xe_sriov_probe_early(xe, desc->has_sriov);
 
+	err = xe_device_probe_early(xe);
+	if (err)
+		return err;
+
 	err = xe_info_init(xe, desc, subplatform_desc);
 	if (err)
 		return err;
-- 
2.43.0

