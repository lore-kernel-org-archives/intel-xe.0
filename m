Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E58AE748F0
	for <intel-xe@archiver.kernel.org>; Mon,  2 Oct 2023 16:14:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C84D210E2E2;
	Mon,  2 Oct 2023 16:14:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2832F10E2E2
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Oct 2023 16:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696263262; x=1727799262;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=N3IJy4hssymCb66Jwztt6tm5p61W2I7Zmu/XU8XGCoA=;
 b=oJla5rQDjUaSlqIjhRtPj+y6P18/cEt62N72vtEdqz+yYTSTicXeld+r
 2eeuA8ApC5bJy2OgD/tPrqwBuYIMPR9v+Q5k7K9C/9pIN91rR9DFRgdLQ
 24cpRJCchJKLG0ICDEymciCLe5ZYhULuhvYoGeN407nBsO+VVnFdtFuHY
 kxxamnmQrzNWuVftZ2IE13lggnjtFMd76B27b2OE09IEXMBG8IMf/OcL1
 pgYkwpb5H2TQThssQ9Au+w8oJCbYE/EAYaLVJ+FrUG1HUAVlIm88gDnIt
 HGoEUbVMBfizRDB3f6i1kRfmMZSlGwzwEAA+Yid/UxUcY2ps8kxgEs/qk g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="362947000"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="362947000"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 09:10:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="997668459"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="997668459"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Oct 2023 09:10:20 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 2 Oct 2023 09:10:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 2 Oct 2023 09:10:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 2 Oct 2023 09:10:19 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 2 Oct 2023 09:10:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cv7m4yt9a7q6kUMpCAydJQDSZ956UDeh6Q22zdHdtcS4BMk+my4XN1ybdF6/W139rnN2urHtDgh2eApWXCoFB4Mi7lI+/w2HPEm6fNC2xVaKYr2uN0D3Rek44FzvdMdTkW/PfHDwU81K724jVkWI7/hvp7TQ6Qr8OdiwcJJG6XioBydVtxIUN3gYcNI85okohAkFEgAjsvQj9q9XXq7wGTH9qZe7jh99T2X/7OdcQKYPCbiBCX5uDdwRC15wp+1n5Dufcx0W7Wk0gC43Rkv3apy3NBbw5kIBrel2q/vKBqi/rUKVux+i3FYHsZ/4mJdNmyHAe/8OSyN/OZd4anl8ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zfOU9jWnKKpTF1ey0lB6KWByYX7NqgfebnGxCZ0Ce1w=;
 b=PPnlkuBkhhM4nuM2ibGU38gkLo/4XGaPV64FS3PnGXfTs8/M0GFyvaF26MniPseeBy9BceQlG/NL3Ra86pcz5EbYzGJP6VR1rC/Q1YZpK9UYBhju7yO8UvKBLSuSBjx2fth93lD4r8OuM8/tk3nrCmxt2q+4SLKhyNovDm/T0TFMyalXPdvaLUs8VPOZy6ijy5+AOeAbL9BHmWGq88f/CecAYBpSweF2lX/0YyMgQgdjOIHHJuN1vbiLmT3zEHb0bGZZ9y/3YJIxCB0ARfSuur97l8kNSP/8KZHk/jaEatEYuC9oliGJwpOqrwJT9eEjDV+HHIAuFuTR5z8zVfVkkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6461.namprd11.prod.outlook.com (2603:10b6:930:33::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25; Mon, 2 Oct
 2023 16:10:16 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.029; Mon, 2 Oct 2023
 16:10:14 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 2 Oct 2023 12:10:04 -0400
Message-ID: <20231002161004.1265254-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231002161004.1265254-1-rodrigo.vivi@intel.com>
References: <20231002161004.1265254-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0245.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::10) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY5PR11MB6461:EE_
X-MS-Office365-Filtering-Correlation-Id: f20babb0-0928-4296-fa06-08dbc3620f7b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Eu622bDR8ir2b/fH14BfyNYNUxJ8Zkj34Y7dB1w9TRbfJymlm5o8CbU1TO6sSlCxBV4A3SoZ/omxRXGmELZkMsMe0T1PLFcp39k51jzfVX+cBk4uu7up8o4X4Fam4gTsjsM1eo3pAVJ7xbov09gNuBx8v09b3XhJtAoNtJsh/AVy4/8S7pK5VRileKwv7HwUGKJ2lgLeXRz86S8H/Q/OneaMAiAk6r1obM7VvtwfdktPcj1+fomMEfKy5NTQCvBIJL1hFM1WyDlJ8nfSjpPAwRmfm+/dTGX3Sy798uj4AfvXekceDw0RyMy3GEGEtKHcoIzJrN2XjdUcBKrcMcmm3tjupH71HC91zKtMNmvqC5xM1Pp6JcU06itkGRoFprrngkRaGPQkfJY+YQBLhTHDQivg6hc0XuFuO+CpnEK9zfXJ9ZXUv4zKWDuzgp5bkBzDQyYqGe7VkgWUmJJcLfmQRFMuNvnV/Ns3nN8Xj05EvKiLxBanm9l8JFbsT7HZl2c2/VYWXRcS2qskr/vcFnQO3jRRI24Un3ybRZ4R1FSbl3w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(376002)(136003)(366004)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(316002)(8676002)(66476007)(66556008)(8936002)(6916009)(41300700001)(4326008)(66946007)(5660300002)(44832011)(2616005)(478600001)(6512007)(26005)(107886003)(1076003)(54906003)(83380400001)(82960400001)(38100700002)(6666004)(6486002)(36756003)(86362001)(966005)(6506007)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9AxIOMTThB+tX+9THFxA7agZfh9CJaq02eVHkORwDAWAeOwVsojTJqImUIqa?=
 =?us-ascii?Q?ubbEXae5CjS0ccIW8SoZRIp9vot0fgEyNSJEfOLWHDPhzVz9L9Vu3S1XdeMN?=
 =?us-ascii?Q?4v/baFF70a/J5UwaPsiD5fFSIvqirR/KQ/Tk2b5TjQXyBABnkV2SpK9IRj8H?=
 =?us-ascii?Q?9IhQTO3XagmnPsEeHhmTlfFXmYzEmkInNrQYNxul3fXuSEPzX5tG3fjwnu1H?=
 =?us-ascii?Q?zYQ+4AprkKEjpMktuULcJd/v6FB7PJq+fEkntKViEyddRIAB/7P1DAjs7fz9?=
 =?us-ascii?Q?smfGdxujE6RzJfM1aVQa0LbAsf4mbPLX2HwxnAFp+suVCQLs8ClGML/yWZ0J?=
 =?us-ascii?Q?8WVuS+2eQ3OEVImg+tNcRUgpQ8mFRBaTaW5sfVS10eGbSoHvOImHSgJ8h4lt?=
 =?us-ascii?Q?XZMSK8Wb0ue/NZ7YA5maEWwcDuVwobP0kZ+j0egzSMiFYSJYAQQinQsfi61L?=
 =?us-ascii?Q?uzggRP0I1v00LvqrV2uCmRCZzTcrMtfSUEeBeV7NjhWyJ0Z0wHh0twwunHcf?=
 =?us-ascii?Q?uhW7jKENjREwYkXPLEtI3UTnzvgM7JpIxzwdqpPxI8pwgJf4Q7W0u4x6Gt13?=
 =?us-ascii?Q?2shjG9imTtCMEjz5IkTcmjLy75P2m1g5QvTpLte7W+Xrh5L14UnU6QP2NC+V?=
 =?us-ascii?Q?vDFf/tvMqD5vmgJwwGAHTIWGCd4/cWf/9t+70RFfj3yMhVH4JVFKC5toCooJ?=
 =?us-ascii?Q?yyNY3+5sC1H1k795UPkQszKvseGaOefZ2nJUoGh7lxaEQ06LQVre0Zfuljhl?=
 =?us-ascii?Q?ED+/930qShI2X8+VzecddSILXN2AytmXIT4tzx7+sOaOAYQSwMBH1C8apoql?=
 =?us-ascii?Q?GG6piyvwPcci12NwWZ3dd+IcRC/dpjQmdoV1qVgdDA6ji0QI2+KiqxnF2/k2?=
 =?us-ascii?Q?YP05Jwo3+HmGB7LpMTQXRbbT/JP9dlGEKesmPq1LjeNe8K/B7JJEzmMV6+mL?=
 =?us-ascii?Q?o5LLiXrntGhud1IbA4kkQEmKTMAEon69RKjq1F0OPwMdTMsdq21RlJ1bV53m?=
 =?us-ascii?Q?ihLojovx2I2TGrky2K7N4k6lEub99LGm7HeNTtgkQEdyvRH+KOqyu02qRMlF?=
 =?us-ascii?Q?zPQQvtX+1sA3v5ivzINFqRFTG6Rt/9gA5fVecBF3GRHDgFPaTG0K4gC+s3+/?=
 =?us-ascii?Q?Jirwuurx/j/+0S3zlbnnEGBhyG2RRceW1Ut+hoj1mzVeYKTp7g6+FHKO0CEc?=
 =?us-ascii?Q?SMqK2oCG3c798wQ48CiAObCHPbo/IeGVJepqWAfJGTwoGfA/DwTtRKOFb9xu?=
 =?us-ascii?Q?GNgRCj7BAplBYQuf3S+3oc7tUgEcciVLR3wlxCnYLFSg9y6DH5UuVBSO99Ie?=
 =?us-ascii?Q?UoN1c10vUuXu/AG/upn+C5+hgK0cK29MQ9UN16LsxOF47jgUe+eY43WvRDsR?=
 =?us-ascii?Q?IJ0hqRf58mylFhjxbSO1lz0ty/F6p922nRtfM3/vqocha0LWelp1R9uu7R5V?=
 =?us-ascii?Q?EcQB4tDP73Ej3i3KlE420ch7Zfeph2KVoVTmeI7MvktXLKWqlMzu+aKafWds?=
 =?us-ascii?Q?U+ANCgYPBsfx79lGFmP18j07h2X5vryFtsUcKYV0jIaBd+vEusstvpJO54l/?=
 =?us-ascii?Q?1S5iWq+BVvpyYexLUNgKsieEsLIR4xo6hjY3RtCu?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f20babb0-0928-4296-fa06-08dbc3620f7b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 16:10:14.0932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l8lGAUip64j14SPyHjCXCMnC0jZN2lEhhHXMJfqMnvgymyS+n/JrwRBPaYnN0DZ3yBYja9ky3P/opI8gh2g42Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6461
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 2/2] drm/i915: Abstract display info away during
 probe
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
Cc: Jani Nikula <jani.nikula@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The goal is to have this function ready for Xe to use
directly. So, let's use the available macro.

Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230929205023.1202735-1-rodrigo.vivi@intel.com
(cherry picked from commit 4c7690614c8bbd6cd29b949f9084ddb294ffe284)
---
 drivers/gpu/drm/i915/display/intel_display_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/drivers/gpu/drm/i915/display/intel_display_device.c
index a6a18eae7ae8..ce55b968e658 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.c
+++ b/drivers/gpu/drm/i915/display/intel_display_device.c
@@ -926,7 +926,7 @@ void intel_display_device_probe(struct drm_i915_private *i915)
 	else
 		info = probe_display(i915);
 
-	i915->display.info.__device_info = info;
+	DISPLAY_INFO(i915) = info;
 
 	memcpy(DISPLAY_RUNTIME_INFO(i915),
 	       &DISPLAY_INFO(i915)->__runtime_defaults,
-- 
2.41.0

