Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697F4606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 10:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ixZ6dV9g;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=HCQB/lQE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03A5C1122BD;
	Thu, 26 Nov 2026 10:09:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F894112284;
 Thu, 26 Nov 2026 10:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795687693; x=1827223693; h=from:to:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=sIp22B6DlQivsLTxATfRKG6JspFgJ1rzhPjDQMXl9bo=;
 b=ixZ6dV9gBbEjm8lJ8jNorfaqFaOSVX/FW4RaFs81YXNV1TS3Wa2l3QHC
 7ndtefIAZcW12g5hb/LxQZLBTKkDMwWGFHD0wJHqdRJc6xiQW2OSGkktm
 K7Z2WHjJA3Y3TdriFLPm3NbEQ6veO+QMWPAYwa/Qq8IlSCNTeZFT3/n++
 JTAymfUcNLVILBUMWTRWeSK9bsZoFYa8v9zD92tFlXTssPuhNvuGi1v5h
 OkfKXpaJ/BsD9g7hUS3B0dT/g0YKAgCMNIuk+SjLgePPwziOCaJyHsLLA
 DoHNEr25dDZtqIvIFAAFkHV26ibBPbc8TULVa9Q8klLeyNoaAbSUezSNl Q==;
X-CSE-ConnectionGUID: v5/QDtoRQt++DLl+VwPEGQ==
X-CSE-MsgGUID: fPSN0aqXRKS8UvJpvpeRxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4499553"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4499553"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 02:08:12 -0800
X-CSE-ConnectionGUID: /CFIO8vwRv2keCrKNzMbRA==
X-CSE-MsgGUID: k77fw9FsRhS9HKlfXu2BlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12393136"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 02:08:13 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 02:08:12 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 02:08:12 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.47) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 02:08:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t07DlvDcGNJlAHLRr/Vbblp+h3+hFqEc2X+Jt7hC9kpdzIL9JDkU5mbEHr9P62Tb98rL6mvpN3PuxlPzDt/+Ay0UP6PcwHmKy+303WCqoRms/cWksNkjxRMeL/C5sHl4611ZDKAVFUG81g4HEJ5P5q11rg+U27YHVtWtRXrpCsAPGIe9Gp4x7UtpCKH5M24SagnXWYZM0knI2MmI3QeUiUstEhuiugJAJQwg7zYQgh3n61pe1T8TFyrB4vrLqfmJ7ad/fqnVNfI13357FbLHicL0x6nfejfu0ZwgjJUcoOMbnqZaaaDxmtVjZ8bOdgv/fwOxrYKiedaFmlZpsEgG0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HXdbAiNKAqv2FqpNS41jpgk5Au1zmIh9Sd1YtFzFWRM=;
 b=HdVnn+lz0J4CTJD4vW83pviIwl47ULQaHBvKk4rkNljyvDl0edJ02+Xp/uNLeURl+5pvwmzUmWML3FJ2DiHcc3X2IkE12S2KyoD8TM4BpYHHv12VI2iUTMhq7bofKCwqq8t01fvSmw4O6OffG0P40M8SVJMQliojgq54iBy8ppAfaTweV2TPx9hOFIVUhFPKJMet4jKztoHhRYmQpuL3mNUMZYVmoCVvWkWeXz3ZTBEENfSvSEJ4Ds6JlIoSdC72OQ8jkS07BTp74dW4ZOjcaYNLzNXLu3MgEKkT+5GKfG9Iplh2RCC2TvOQTZII48gJ8mf1RdB81bECWIJJtEVNRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXdbAiNKAqv2FqpNS41jpgk5Au1zmIh9Sd1YtFzFWRM=;
 b=HCQB/lQEr1SS7Jp8qNPgqBRqQBpouzho3BUBVNObAhJlXhUQbB6y8SVCbBbhBwvQuNHWtf4QcUhgspyvVo9+jLWqIjZaHLGWx8cIUHwKmcbXUO0aOLgsB7fL9Lfnxq03g4QGB1GSENmvPKpcaUoRURWFUv5m7BKd1BQ3vWcrsGY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9273.namprd11.prod.outlook.com (2603:10b6:208:573::17)
 by CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 10:08:00 +0000
Received: from IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa]) by IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa%6]) with mapi id 15.21.0662.001; Thu, 26 Nov 2026
 10:08:00 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: [PATCH 00/13] drm/i915/ddi_mgr: Add support for dynamic DDI allocation
Date: Thu, 26 Nov 2026 12:07:40 +0200
Message-ID: <20261126100755.1252635-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.49.1
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
X-MS-Office365-Filtering-Correlation-Id: f8a6da86-6931-4523-885f-08df4ba526d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|10067099003|56012099006|11063799006|261026140227099003|261028144727099003|261022105027099003|261022075727099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|261009221227099003|18002099003;
X-Microsoft-Antispam-Message-Info: 75t/KFMl0ghPspIAcnqvzsoUNYvycvb5CnnIfwiWPGKlJ8xyYOhn0nafx3PG0zNXmnTKR6Vt0RC+kTIzXUnUdDxG66e3LgZRiKux2lIPcL1mJcg9v/MaHQVF7jJiYfoFkvch4HqV9MQIO2AWecTiETOJoOuF6PH2Fpb2IcB1+b8qIyGyGY8GTOwoSsj5RwK7rjYb2KyTJf+XFbibKRAt1KTyIx82XSgdO1f4dvEahssyWvT7qLb+u+5+HA2GqfmasJTUHM6KshZ+q61pCHhGvmfO9Rg412oWk+rb0jrScpU/sLctKvkhu5z8U+uceVGtzrR/NwQMdCCK8ZnyOWUaMuNwjoRgHIwb+Ibuuv4ybB34nlfW08BOaiTLf8Fj7wxCLa0nzGSlI6y5Z1jT0FTjYO1ZBYvakMhJ0ayDMwkIqtejaFKV/U1+C1fGE2LPllRurGV99MCJUdz9kIJsEyNsIjiaJPjmjyyHTdEZjPB0GtFLpTXSyu54D8DdZwpnu5Eu114M2tWEhuAktzc7qlk7F6QZNaPmuNg63CEGLHIt8EuIVS+JCh0ej3eFW+RTX1DgtCaNRWKP1xbWq8M4iH4Pssy3uUTWVc7yf5BISiBggI0NVoVYhN0KO+ndrN94nMeDJ4IAmRxkeI+86vlc6IshEY+QMEivNuXw9vJ1ttRob7I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9273.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(261009221227099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sdoZ2tcXD62D2Rr359QvVDSgF8FgbQSDRqLxkeAR3lxaAp7J/Lz1cq1s7isj?=
 =?us-ascii?Q?ApCbVzZBu7x7eQp/vA/aYuTEugYynOXMdWZFSBoE0Vfjojc2I5VmJ8/fHgEW?=
 =?us-ascii?Q?7toRQsim4eEYnjlX+GClW0ZuPC6qEh00bmak8lv5OOMY9EsrAuyLyXA0Bs0L?=
 =?us-ascii?Q?xSAwDpvrC8kv0Cu7XrZ3FufuGIbQm91RnJ+rHzQi3uaEfc5mrypJi78npGCW?=
 =?us-ascii?Q?unjVWnvLlw9O+9200QFIycqaQUKlRBgi5/VMw0bEUZIY5VVsFnulB3IUPrp5?=
 =?us-ascii?Q?mJW0pKRiQeuaGobVfJsq4AqRY2/HO6a5rgDglLEomsJNht9AZiEJeFV+6uxF?=
 =?us-ascii?Q?XNYZlBKdevBvkKzgD5IL46k4I71q6plKNxT9x5UrCWK/ebZ+CzXRxamhLBfo?=
 =?us-ascii?Q?OkIDpMlpA0HWmaru7zZFGMy511J7iNtL1I30LqDKtNyLEqv2oiHOr8WTw7R2?=
 =?us-ascii?Q?oFsZ54sInmhGbUAVOv9hyT+7wdx2tbBuZcDI44Mn4wPwb7k44SGSU8d8WImj?=
 =?us-ascii?Q?CGLCAdDwbcCsdW8AbFsPeCIo0UTLrDfl5/csPSKRp6cX1TKii5VDpamZKzIf?=
 =?us-ascii?Q?KOv4KdfwlIdt0WbSD4ZW4AQ9iRR7RUl2/dV3sf69170yQS78upABsxX7yMqP?=
 =?us-ascii?Q?7aJgLHUoB92IzfPr1yxjK0DiL3yOH4lbnV8uD/rOPbX70CGeKsYlL2t2DIW9?=
 =?us-ascii?Q?ieb0qg1cskpPEIMRL2aT5dcMrQdeL1XzZaJF8SxGFgl/P3qpeb4L5h4bd9V6?=
 =?us-ascii?Q?h2MPx1V0s/y1ffE6KZ+/E2B1n5sRQ+WptG2Vwc6MfXhdFapzLGloAF5piPlg?=
 =?us-ascii?Q?pvIf5lu9zQ2TPn2qu5QJkO7scDo8YruRUi1ivwk0ozxX7AjubAkV2yxKyqoN?=
 =?us-ascii?Q?wKcovNYq6a/RqytYu9NYLMRV7v/BUNgpNDdfeQtiuhHnYC61nBM4bjwzk6n4?=
 =?us-ascii?Q?5Uo+WCDdhe7bhmLpW4QWcZcZouYXvJFmiWMr6hNhQwLoxFgGQ0jrzOqkJ/NL?=
 =?us-ascii?Q?NGJtlZpDV/IWhtflSlnJs1LfPWHt303lhbUITFHARwdMdiwWmeOoZlCfyfrO?=
 =?us-ascii?Q?lHgRhT+MYBu1kO7ElEQOC5DADD7DgQ673luj1P0O9uLcPGAymQQsvUmEf5T5?=
 =?us-ascii?Q?BWraFdlUobQZT/0UrDkrxU9gFV09kX+yVeyWilnMr727zYGPfffLUQzS03Vx?=
 =?us-ascii?Q?3fJ0UQMnhm7cQHW7p/R36V4sTfYKNaHNDvCUsyAHCoTgIb/i+XyS7GMga8pI?=
 =?us-ascii?Q?HweUjrfDiyIIJI1fIIWmjAuQTyh/67HaMFitunFkdYdKkcfTptTnfaviFNCE?=
 =?us-ascii?Q?ptzMHqHJ7DBf1Pcok8Rt7W1Xl4sRyywY5vNlLQJZ1L7A5aK7bqebNxq/vInU?=
 =?us-ascii?Q?N7i4LUqD9AFurbQlL936pNqE+0rCf7iMO0weKhE2w+PzusFVsm+rLyIOg363?=
 =?us-ascii?Q?s4V/UvP+hcER4m/feHzk/8RlTtRj9uS1aGaGBq4dAydfcxHNbvp/vIE37FKB?=
 =?us-ascii?Q?8WVbsrPNfJs9TGGpkpeu5mozfzIaGBWEJ3djTiQfQXCH3zmoqaFdi7tJmi/a?=
 =?us-ascii?Q?QvlD0394kzuQpnVlpj6swL1kPgxzCBunUg9h5MBxUT3bkhTDnbCakgfAan7Z?=
 =?us-ascii?Q?x6z7hMzYFi+HvFdKYF24D5Ro6ptoxMZsdL/cPWjL70WR9yW1FIV8d0+HN1wq?=
 =?us-ascii?Q?jTe0+4aFVx6TJdrxhCRQGjLTsH36qd+955lCbmSfH2lwn0Q8STYtIJoynUU4?=
 =?us-ascii?Q?LTZp1AccUQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: MmD7SXCbA2WppQOv+PpyWBS8ldddzm9KmOylJwWqpY2DUjhFvuuX7kNt9qkJTaGgVO1oMhdnKMRexUlCbmlRYLhN8ynFiUq7KmcSg2FCgw3bqn5N2f9eesuNW4Rx7Sw21/eBTeMvvK8gFf5ZE3j4CqvfZ1wnmDCIngGb02O+4WGZ/r+IlEy1XOFzmEGyvaGIJdvhymCg3NIGv0xbL8NYaw6O/gqrGim2mIN1pRRDupwaRhp/WnkNGaqEBL47/wtzPHJ/WVqM+JbjTGqPhzRp9oqqnW5UclEUyJat2L2lVbObtx3xLPiFnRdmg49Of+ukPribEiLpNY1SlWnpjHMzqQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: f8a6da86-6931-4523-885f-08df4ba526d8
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9273.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 10:08:00.5908 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u1dv6A9X7mAHohpEn4AHWrLkJ2OUHB/uYoXhJEaWXRVbP97tw9aQ9epsYYoEfnStItkjkMOisbclhccqj4ijTw==
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds support for dynamic DDI allocation on NVL+. This allows
a system to have more connectors than DDI HW resources by allocating
DDIs to connectors on demand.

The approach is described in "drm/i915/ddi_mgr: Add support for dynamic
DDI allocation".

For now, legacy DDIs are inherited from BIOS or allocated only during
driver loading and system resume. Runtime reallocation support will be
added in a follow-up series.

Imre Deak (13):
  drm/i915/dp: Allow rebuilding the source rate list
  drm/i915/hotplug: Set detector enable bits without a clear mask
  drm/i915/nvl+: Add support for remapping logical HPD pins to HW pins
  drm/xe/display: Distinguish failed system suspend recovery
  drm/i915/gmbus: Extract a helper for Type-C DDC pin mapping
  drm/i915/ddi_mgr: Add support for dynamic DDI allocation
  drm/i915/gmbus: Extract adapter creation and destruction
  drm/i915/gmbus: Add stable DDC adapters for the DDI pool
  drm/i915/ddi_mgr: Register encoders with dynamic DDI support
  drm/i915/ddi_mgr: Keep AUX access consistent with DDI pool routes
  drm/i915/ddi_mgr: Verify and restore DDI allocations after runtime
    resume
  drm/i915/ddi_mgr: Handle DDI pool system suspend and resume
  drm/i915/ddi_mgr: Enable dynamic DDI allocation at load

 drivers/gpu/drm/i915/Makefile                 |    1 +
 drivers/gpu/drm/i915/display/intel_atomic.c   |    4 +
 drivers/gpu/drm/i915/display/intel_ddi.c      |   18 +-
 drivers/gpu/drm/i915/display/intel_ddi_mgr.c  | 1107 +++++++++++++++++
 drivers/gpu/drm/i915/display/intel_ddi_mgr.h  |   32 +
 .../gpu/drm/i915/display/intel_ddi_mgr_regs.h |   40 +
 drivers/gpu/drm/i915/display/intel_display.c  |   12 +-
 .../gpu/drm/i915/display/intel_display_core.h |    8 +
 .../drm/i915/display/intel_display_driver.c   |    5 +
 drivers/gpu/drm/i915/display/intel_dp.c       |   16 +-
 drivers/gpu/drm/i915/display/intel_dp.h       |    2 +
 drivers/gpu/drm/i915/display/intel_dp_aux.c   |   15 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c    |  214 +++-
 drivers/gpu/drm/i915/display/intel_gmbus.h    |    6 +
 drivers/gpu/drm/i915/display/intel_hdmi.c     |   19 +-
 .../gpu/drm/i915/display/intel_hotplug_irq.c  |  127 +-
 .../gpu/drm/i915/display/intel_hotplug_irq.h  |    4 +
 drivers/gpu/drm/i915/display/intel_tc.c       |   46 +-
 drivers/gpu/drm/i915/display/intel_tc.h       |    1 +
 drivers/gpu/drm/i915/i915_driver.c            |    7 +
 drivers/gpu/drm/xe/Makefile                   |    1 +
 drivers/gpu/drm/xe/display/xe_display.c       |   16 +-
 drivers/gpu/drm/xe/display/xe_display.h       |    4 +-
 drivers/gpu/drm/xe/xe_device.c                |    4 +-
 24 files changed, 1621 insertions(+), 88 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_ddi_mgr.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_ddi_mgr.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_ddi_mgr_regs.h

-- 
2.49.1

