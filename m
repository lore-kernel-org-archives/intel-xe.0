Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0219DC77B61
	for <intel-xe@archiver.kernel.org>; Fri,  7 Apr 2023 13:31:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 905EF10E2B5;
	Fri,  7 Apr 2023 13:31:31 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB9E310E367
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Apr 2023 13:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680874288; x=1712410288;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=hdF6YM73heoroLqrbmEhCc4buvC0gnzmWZ66noT8rkw=;
 b=FSbE1PWv/cLi5LCI5yH9y1eKMm99FsjEX4zZeQtVltM9fdtzB6ys3JDS
 Kuy+NXuir9vy7S5MofUTHp1VfH3Hp0Nq47cT4e0QrlF8T6ucfdvbr6Vpd
 sGJBbpmenpfzv0FrakjeznvuLj+BcW2l14b0PpADlilZPergcXT4uMQZG
 qRboH77KGawEqAH8N2VTuR2nBqoV4u0Gat8IiVPx1r2jvFJjAgxZ1licu
 Il9g6fFmwVJdVhiQXDs4SyCQjCVdzh+b1RJ6ebqViasGQV28VKNDER192
 aIVKlNs1cr9ql4WytFI4Bx1WV3CrLffpO+YVRtcUU75Hyyh07V4Aan4Ac g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="322626467"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; d="scan'208";a="322626467"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2023 06:31:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="776835114"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; d="scan'208";a="776835114"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 07 Apr 2023 06:31:13 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 7 Apr 2023 06:31:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 7 Apr 2023 06:31:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 7 Apr 2023 06:31:12 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 7 Apr 2023 06:31:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NtUdLnyUhP4F9xCuVnTBtvLBoymFpVLJo6yB33qEglrOx/S+3Z3mU8G6qt97o4SVjGwX31eIp4LopV0152YCv0qVp6yl+qFzHYAlRUAnJujy6qwW5zHhnqvkqDdqI5EVsOzidzQRGPaWW2OW/LHjqWL8aHm0iAi84E8xGdGo6viSMyqUwpdQXPvlADI2Rj8GEvwrvSPHWGBf3T8JjSjumJK/c8JVKCKToJWJxAg05WEV+Wsh7bChEQHIo5wbY13hxj6mTUPIKAATRFPLXHbhs/4x+nvzpgrunnULM8ELS+25hRVk3wct+68KouDs5wZYTqVpcZsKiBfhoeTS/AhUhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QUmwt4s6QUbvByJQD3SxNv5K5htQtSj2yhwBH3btPv8=;
 b=BIhWNhg0nXeOitIlFGJfgNyqA5B1Z2fFt8+guMEMXZ0gF1RR5S0LbMn1mMaUgYIhAkLufXc7B5I+qoh8DCz0wzp/eux3DXAsZ0b0gsV8KyVow+4rmRJSqOgy3OnwJV7jXEdk2WGRaccz4ZlwP+zRG1pv3dqhEGKGyueiVRo50rBk8DSbjmMHPEXRRewDW4fhZbPcg4yckqNYg7poFfOBxznFMMnFk6vfUkELX2waqZTBKrTy+rMFdC0x+4jr1jbpYBNZDXrozZpZYePQB+p6eweTtyvDlPKH4DeUPF32VEYyn/G6+uvJhxxQqIIm47DUq3NyL3pAuBKB8hlpvBSoWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5165.namprd11.prod.outlook.com (2603:10b6:a03:2ad::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.30; Fri, 7 Apr
 2023 13:31:11 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%6]) with mapi id 15.20.6277.030; Fri, 7 Apr 2023
 13:31:10 +0000
Date: Fri, 7 Apr 2023 06:31:08 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230407133108.mm4gqhkthu6yzeuh@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230406235621.1914492-1-matthew.d.roper@intel.com>
 <20230406235621.1914492-9-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230406235621.1914492-9-matthew.d.roper@intel.com>
X-ClientProxiedBy: BYAPR08CA0072.namprd08.prod.outlook.com
 (2603:10b6:a03:117::49) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5165:EE_
X-MS-Office365-Filtering-Correlation-Id: c76339d4-e024-4e94-ed37-08db376c5988
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JZ+XfMKKx9faFQu28Ob4IZYf6et67+Vn+fBlNqk0PhZte4P9gMVgjcNmGmoHvlPp5bqUguOX3FVBqe1sn0kF3eaCwQFYPOLuwpoXMKRstru/AbaaHUlKKocYA8UtScrTxhiKPcFWT+YOwv5QXH5dA6q7e4OFEjIrjUyJiQ/sGnl16hyg7WO3If3SjyqpgQIFkKOwrVaawr6+tbhZM9NdZQX1SCDYypx7tTDawcjYlA7Ytps4MUcoIjWxDfHNu3ZRsxZV7GfJgAzgQ8XYBuiB0NT/0vQKcQ3yAuLpInyO1dT8WG0pu0u1veWwA59vDaEhVc/HDmJzgxEirkPiC6n9l/TYdbS67/wzP7S/LfD6z+yOZuZmP6b4EO5iNtLsXa2yJpJIliAbSoNW7hhc+GFCot4D5U35pNyZ3s3KhVttAQEsWMKRIuMS0WSFTT6duOLzQE6DJQohqzJFO8RlMUSCqC2aG/rYku/uE0O8Rcg7CCBt+3H2AkpHcI4vUugVG83dSMoUjCeA+ICZAsclz3t2kTNYHGJyKh3eqU6BwxEivtfAVgRSsB2VAw34L0AubRAM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(136003)(39860400002)(396003)(366004)(451199021)(9686003)(2906002)(6512007)(6486002)(186003)(83380400001)(478600001)(316002)(6506007)(26005)(6636002)(1076003)(5660300002)(4326008)(41300700001)(36756003)(82960400001)(38100700002)(66476007)(6862004)(86362001)(8936002)(8676002)(66556008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?1HsUx4YzO/apU0ixkYgTWQZCg//13i5gzY5WISqL6CCfktMUsB73h34v+M?=
 =?iso-8859-1?Q?Q5kjavVt/qyi+Dhdlu8kMFFTBFtsnpMBHMzlCTo4xbUi6wzjKsW2BBx66K?=
 =?iso-8859-1?Q?Q83DldzRlbXSOVinwl0dCkAPiOhnv/EF854j71uaHV1pA/9+ciqpSELXR+?=
 =?iso-8859-1?Q?VlTGGSZqmKysp2nETuSz0nlebqiOS62NXgZWL6BalBIkJ2iINB3PHnwc8I?=
 =?iso-8859-1?Q?ACnkeWbIazrlbLnCr8X5PMM5+2jnlDryEm1uDsJqrFuXP9Csv950nokZmV?=
 =?iso-8859-1?Q?3z0TwqcxVyteHB0Mx6wh0cYg3khLWjoRf53BPp8Nq1sbkLlTvh0meZpTp0?=
 =?iso-8859-1?Q?sjvKuHEFrDTEgOLsQZ1r5bsONV83iXasZo/n7YZqCtnn1MUAo7M/j5Jhsc?=
 =?iso-8859-1?Q?2umuQElWXdy+NVHkIrYYpjN1euucYXk7vMrF84+YM/lKuhytFNI5/guV6s?=
 =?iso-8859-1?Q?mqZvn+tELCw1l6rstTEwKwfBzTNiHRY9m5L185CEbKlaq7cp4KQ7KxU6Kh?=
 =?iso-8859-1?Q?K+jz538mM8f23bopwz+EwudVHK51lnRPeW1zMwsaBuG4gfLN1NLQ5KoW/L?=
 =?iso-8859-1?Q?OR0zquqkAP5gs3C4jmfghWD/FCG/Ts4EaZIdVtmribGm+Sh3FSzHQjRdMe?=
 =?iso-8859-1?Q?R6QkgZYSA3S5uBrJUbAC0Mfz3Xl+9gl2Yrs+7Ckivbvqm2QyXATl3yJx0c?=
 =?iso-8859-1?Q?ejzsaI3pUxwOocNlXShFojPdhghBGzjjSGLCh0AEsf5ZzZ3z/yeFW/LdMk?=
 =?iso-8859-1?Q?ucGoMboy3Z9EotWKlwNMnQuQE/hSUdsDqFkVOgQjJ9AQ8kIWGTiefIKYzb?=
 =?iso-8859-1?Q?vqz720AqLGS4Dft78+tUCSMC5/1BEirgdhaxFMQm8xsnqcoq3QtBtrCHbD?=
 =?iso-8859-1?Q?gkCgkLLBoLUgF/6Sk6b8jdpFSdytsgtneekp6zlvq0yd/cyQ+xNwF2NRRO?=
 =?iso-8859-1?Q?9mq26BHnFhjauANqQ+FLOI7S4s7qtSv6jIEpdTZXrJ/Jri+46qByPf922B?=
 =?iso-8859-1?Q?3xHZlqvNROmK1r55bEiRpQoq4fNeNwvxky8JUvg6p3ScxtYR88ossFM7NO?=
 =?iso-8859-1?Q?jBWNxDYdVR7fugdY2bOLo868aMkAWAO5vz6MlHFyIryeuxi+tqoOJrDMzm?=
 =?iso-8859-1?Q?R0kSeG0DAtfxY91iA/5SdOixk4ZEPb5YpKG0cZATkRKugAqQUK9DTb9yQl?=
 =?iso-8859-1?Q?GA2CZwJIAoKyUz4FlSaYii60lsVIbvgCd+pkG57EDij8QWRzuLEZvgxhnH?=
 =?iso-8859-1?Q?VBVCD+B6qOaaVE0dr/bqNQv5ghxJ6CrOijjvj7MkGDz8D17Xc4RgvCGSNY?=
 =?iso-8859-1?Q?Labv7FD0zRYcPqVXrlU+qjlZYnRrRIJfv+D87bCcR/8ASYomNy4RGwfQCK?=
 =?iso-8859-1?Q?84zet2DMyuEUUgnKgI0GmySR5+BnLk2zLNNskonhXK9hg2B8uFVqz5gKW3?=
 =?iso-8859-1?Q?YjqLAwLT/M/vdc0eu8peRpIFpQdpIiwpueA3Pkx6DYUmiX58pnEXGfoS8P?=
 =?iso-8859-1?Q?SBdr8NEc8RaRWX8RrUeZWiq5R4EAh2G2lgBkfMtw6QmeSNXXBqRO/23M59?=
 =?iso-8859-1?Q?wNRgH6oyhpbcuOaXjl0ZjYxG2RHqPZFqRaieAT6otOE8f6b3YKp6NjEX3Z?=
 =?iso-8859-1?Q?+se9qf92uirhc0hqkDjaS1bRLv0X3mmPBHflxpbwcqGADIdTHQofD1kg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c76339d4-e024-4e94-ed37-08db376c5988
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2023 13:31:10.3241 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XUqR0NLxwbBphQCpSKmZdmO45z3DJrdYcr5BZmir9I05HACy6wJxP0nfBDPZwlWnmyUMCGvqyZUCDh+WQdtOrO43icfpnc6/+7ba7aNtBC0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5165
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 8/9] drm/xe: Add KUnit test for xe_pci.c
 IP engine lists
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Apr 06, 2023 at 04:56:20PM -0700, Matt Roper wrote:
>Add a simple KUnit test to ensure that the hardware engine lists for
>GMD_ID IP definitions are sensible (i.e., no graphics engines defined
>for the media IP and vice versa).
>
>Only the IP descriptors for GMD_ID platforms are checked for now.
>Presumably the engine lists on older pre-GMD_ID platforms shouldn't be
>changing.  We can extend the KUnit testing in the future if we decide we
>want to check those as well.
>
>v2:
> - Add missing 'const' in xe_call_for_each_media_ip to avoid compiler
>   warning.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/tests/Makefile      |  1 +
> drivers/gpu/drm/xe/tests/xe_pci.c      | 44 +++++++++++++++
> drivers/gpu/drm/xe/tests/xe_pci_test.c | 74 ++++++++++++++++++++++++++
> drivers/gpu/drm/xe/tests/xe_pci_test.h |  6 +++
> 4 files changed, 125 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/tests/xe_pci_test.c
>
>diff --git a/drivers/gpu/drm/xe/tests/Makefile b/drivers/gpu/drm/xe/tests/Makefile
>index 56919abb3f2a..51f1a7f017d4 100644
>--- a/drivers/gpu/drm/xe/tests/Makefile
>+++ b/drivers/gpu/drm/xe/tests/Makefile
>@@ -4,5 +4,6 @@ obj-$(CONFIG_DRM_XE_KUNIT_TEST) += \
> 	xe_bo_test.o \
> 	xe_dma_buf_test.o \
> 	xe_migrate_test.o \
>+	xe_pci_test.o \
> 	xe_rtp_test.o \
> 	xe_wa_test.o
>diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
>index cc65ac5657b3..d357cf1cb07c 100644
>--- a/drivers/gpu/drm/xe/tests/xe_pci.c
>+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
>@@ -62,6 +62,50 @@ int xe_call_for_each_device(xe_device_fn xe_fn)
> 	return ret;
> }
>
>+/**
>+ * xe_call_for_each_graphics_ip - Iterate over all recognized graphics IPs
>+ * @xe_fn: Function to call for each device.
>+ *
>+ * This function iterated over the descriptors for all graphics IPs recognized

		   ^ iterates? 

>+ * by the driver and calls @xe_fn: for each one of them.
>+ */
>+void xe_call_for_each_graphics_ip(xe_graphics_fn xe_fn)
>+{
>+	const struct xe_graphics_desc *ip, *last = NULL;
>+
>+	for (int i = 0; i < ARRAY_SIZE(graphics_ip_map); i++) {
>+		ip = graphics_ip_map[i].ip;
>+		if (ip == last)
>+			continue;
>+
>+		xe_fn(ip);
>+		last = ip;
>+	}
>+}
>+EXPORT_SYMBOL_IF_KUNIT(xe_call_for_each_graphics_ip);
>+
>+/**
>+ * xe_call_for_each_media_ip - Iterate over all recognized media IPs
>+ * @xe_fn: Function to call for each device.
>+ *
>+ * This function iterated over the descriptors for all media IPs recognized

same here



Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi

>+ * by the driver and calls @xe_fn: for each one of them.
>+ */
>+void xe_call_for_each_media_ip(xe_media_fn xe_fn)
>+{
>+	const struct xe_media_desc *ip, *last = NULL;
>+
>+	for (int i = 0; i < ARRAY_SIZE(media_ip_map); i++) {
>+		ip = media_ip_map[i].ip;
>+		if (ip == last)
>+			continue;
>+
>+		xe_fn(ip);
>+		last = ip;
>+	}
>+}
>+EXPORT_SYMBOL_IF_KUNIT(xe_call_for_each_media_ip);
>+
> int xe_pci_fake_device_init(struct xe_device *xe, enum xe_platform platform,
> 			    enum xe_subplatform subplatform)
> {
>diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.c b/drivers/gpu/drm/xe/tests/xe_pci_test.c
>new file mode 100644
>index 000000000000..9c6f6c2c6c6e
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/tests/xe_pci_test.c
>@@ -0,0 +1,74 @@
>+// SPDX-License-Identifier: GPL-2.0
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
>+#include <drm/drm_drv.h>
>+#include <drm/drm_kunit_helpers.h>
>+
>+#include <kunit/test.h>
>+
>+#include "tests/xe_test.h"
>+
>+#include "xe_device.h"
>+#include "xe_pci_test.h"
>+#include "xe_pci_types.h"
>+
>+static void check_graphics_ip(const struct xe_graphics_desc *graphics)
>+{
>+	struct kunit *test = xe_cur_kunit();
>+	u64 mask = graphics->hw_engine_mask;
>+
>+	/* RCS, CCS, and BCS engines are allowed on the graphics IP */
>+	mask &= ~(XE_HW_ENGINE_RCS_MASK |
>+		  XE_HW_ENGINE_CCS_MASK |
>+		  XE_HW_ENGINE_BCS_MASK);
>+
>+	/* Any remaining engines are an error */
>+	KUNIT_ASSERT_EQ(test, mask, 0);
>+}
>+
>+static void check_media_ip(const struct xe_media_desc *media)
>+{
>+	struct kunit *test = xe_cur_kunit();
>+	u64 mask = media->hw_engine_mask;
>+
>+	/*
>+	 * VCS and VECS engines are allowed on the media IP
>+	 *
>+	 * TODO:  Add GSCCS once support is added to the driver.
>+	 */
>+	mask &= ~(XE_HW_ENGINE_VCS_MASK |
>+		  XE_HW_ENGINE_VECS_MASK);
>+
>+	/* Any remaining engines are an error */
>+	KUNIT_ASSERT_EQ(test, mask, 0);
>+}
>+
>+static void xe_gmdid_graphics_ip(struct kunit *test)
>+{
>+	xe_call_for_each_graphics_ip(check_graphics_ip);
>+}
>+
>+static void xe_gmdid_media_ip(struct kunit *test)
>+{
>+	xe_call_for_each_media_ip(check_media_ip);
>+}
>+
>+static struct kunit_case xe_pci_tests[] = {
>+	KUNIT_CASE(xe_gmdid_graphics_ip),
>+	KUNIT_CASE(xe_gmdid_media_ip),
>+	{}
>+};
>+
>+static struct kunit_suite xe_pci_test_suite = {
>+	.name = "xe_pci",
>+	.test_cases = xe_pci_tests,
>+};
>+
>+kunit_test_suite(xe_pci_test_suite);
>+
>+MODULE_AUTHOR("Intel Corporation");
>+MODULE_LICENSE("GPL");
>+MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
>+
>diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.h b/drivers/gpu/drm/xe/tests/xe_pci_test.h
>index 43294e8c62bb..cc0f1d141a4d 100644
>--- a/drivers/gpu/drm/xe/tests/xe_pci_test.h
>+++ b/drivers/gpu/drm/xe/tests/xe_pci_test.h
>@@ -9,6 +9,8 @@
> #include "xe_platform_types.h"
>
> struct xe_device;
>+struct xe_graphics_desc;
>+struct xe_media_desc;
>
> /*
>  * Some defines just for clarity: these mean the test doesn't care about what
>@@ -18,8 +20,12 @@ struct xe_device;
> #define XE_TEST_SUBPLATFORM_ANY	XE_SUBPLATFORM_UNINITIALIZED
>
> typedef int (*xe_device_fn)(struct xe_device *);
>+typedef void (*xe_graphics_fn)(const struct xe_graphics_desc *);
>+typedef void (*xe_media_fn)(const struct xe_media_desc *);
>
> int xe_call_for_each_device(xe_device_fn xe_fn);
>+void xe_call_for_each_graphics_ip(xe_graphics_fn xe_fn);
>+void xe_call_for_each_media_ip(xe_media_fn xe_fn);
>
> int xe_pci_fake_device_init(struct xe_device *xe, enum xe_platform platform,
> 			    enum xe_subplatform subplatform);
>-- 
>2.39.2
>
