Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91178CD5BC9
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 14:29:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C0AB10E284;
	Tue, 19 Sep 2023 14:29:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D48810E284
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 14:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695133739; x=1726669739;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=6/3gUHeBOZfCd6ArrAhglsd1+cx4PIkN1D+FcGH4zYg=;
 b=UyLwJjyx7SPzAO8zY9um6f6l5uSfCJG/Wg3y2523XLTmr0v/ImEeOZW1
 BoDTctH8o+CXdQNTVCm0mA56Yt4GamP5bAG+W0/U1y4Oh6oDV9zt3IvfD
 BfNZizkanA96iWDEzr3E+DRONszdiV7I/eLRBt5sxp9tlrccSWh0q+j3g
 U4BEY5dNmFRgP5vRCMIVqGKFFva52POFeEzmYAWyd7zBe7ZjbcH5exM9R
 8f20jXofOUXDDmmc0rR+6qmVZCUXPeODk8uPiZcwEwxbqf4zqr5dfCLXZ
 3ja/MPSGKGgmcfOMy5jLE91BP05GlIhKlovlnLdMyenwwZ9rM2DV/HbcB Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="359350364"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="359350364"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 07:25:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="722902319"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="722902319"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 07:25:24 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:25:23 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 07:25:23 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 07:25:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a0K7+XEFmzDLwlacZzjDBOEevSwvjxQg/hP85WjCT5MUbHf4xqKNWqvdBz+tlcWzwOkHuKIF6ttAYh9WpCevKdxJS6zVwMnJnTZgN7Bm/6vF6C/R349Z3bH2eYjfI4DqKCC1IBTP8+sh7+T8wgOFUn5FR6i3H7rSQRV8ZGH0mh4Z0MYg93oJ2SkRoy216mnitm9GmlCZ3OEmi3lPKlWinPJzZcN5YSb1rPPOIwDiPjCL2h5/nWT03kH1GKf1E1nurisULt2PcR0SwN7pRKf4rbwcKbSJaJmdGY59qfNEj/1jzmxCxoGHIB4MK4/pMTZyV/E6w+ZG5hMKoeXJQKFb8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IgHDSzZZOhy70pbbsryDJjszDzFJ0GMiQlPcVNEvACE=;
 b=hsr29g/+8jEDXp0oPYNNRDO+P+bEJfQdMCTO74/lq1PWgnZUpSPgqZCkvNsP9a7W+KwmtQ/pnxMxiVtvL6Pjea64NPOg3uAQWQVYJSk8n3NZ7iFkFEb25+RRQ9VVJhqB8H4mC1NZbo7BnrT1gkGjfCzZ1S8d5OcwjjRz2OJaJeEbtdk9xz4ToKYpddCsUGQrHzipGLHeCTrUezDt5R/eThP2CWwJ0KDHcpTiSbyEQqBmpXawS6aKomFLq7o5zqVS/fnBWUjdy6HsAZw72/hxT3q2JuUgHXD8I5RINdMqw2KpouLSYnTeqsrrfA/Min4p0/AHnQXx3k8JZ0LGI0xY/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB7914.namprd11.prod.outlook.com (2603:10b6:610:12c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 14:25:12 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Tue, 19 Sep 2023
 14:25:12 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 19 Sep 2023 10:24:48 -0400
Message-ID: <20230919142504.91652-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919142504.91652-1-rodrigo.vivi@intel.com>
References: <20230919142504.91652-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0378.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::23) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB7914:EE_
X-MS-Office365-Filtering-Correlation-Id: 26739087-6e42-4d3f-893a-08dbb91c3c1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3Gdre3k8pU+g9pG2WhuLcgMgyrUYtyo1ZTw4Yypvzbxl2ULSr82bcMkrqEFk4mf9rd+iRWTz9H5/WRQYwv4ENcGdMRnFeV2wLs7zCputPQ0X9KBzT8vikncP2/VhlQTaTpF5wO0L0K4oB0YZdXsASaNm2mIV8lSLADaR/MyvKhaZuGaLCK2pCjCkkvDEUA/H3cCeE0PV17VoWFFI86h2lqo/wgIc0y1wetVNM92TYUHGwNybU3LzrCQCB1IyZKcOqtFNgAHeo0Ja/Vh/aDpNFHt473ANOcx+xk4RcQAFwQTwFFfFNBmw9kXKMYiIJ3TKfcp/MNDiXmxAUrYk85+lZEQF60S4+rAUUKwc2fNqRkYSb2s8zKVeIeKFPxnWWYel8tnEcoQSTlOxmGev8TvZbiyIUYyewgOuBAtX1vrIPZGZIzS7c2gdfgL2893nCR95ypWpb/i2sFyaI7A14SUhISEBV+zZz0X4RHDsxgtcI0L15fWFDEqp9UPD/B8v0FP1f5HpYh4wspSVfg/Y5gf8r5r32JtX1sU58HAxvYDRuNs5Eyd/KIbX8bghrTpJr8Ns
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(39860400002)(366004)(136003)(346002)(451199024)(186009)(1800799009)(478600001)(41300700001)(83380400001)(44832011)(5660300002)(6666004)(2906002)(316002)(66946007)(6916009)(54906003)(66556008)(66476007)(8676002)(4326008)(8936002)(6506007)(6486002)(6512007)(1076003)(26005)(2616005)(107886003)(36756003)(82960400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q17vS37ODfcKhu6ckReK+zF3SM84fWWFIwynJuNXR1NnrSE5PbFgocE9kW4e?=
 =?us-ascii?Q?tZCtlQ8moEbhmHNNey9SM9lUqp3Vlvr3v146MU5RpDnA1eZWqlROHl/cEpEd?=
 =?us-ascii?Q?vb5355Yqcgte3HV/NgwqQH68GnA8u/EerlRvnJadIv77Fm0Qv4S1zOk0dIIN?=
 =?us-ascii?Q?VjbyWOXJutnkJ8bCqNmsJRAAu9Q+aO8V1WDbSxlAW9pJNffroFXCmKz0cngw?=
 =?us-ascii?Q?i8drYnLEf8OMxzVVSrt0+ADGoEAQoX0DMj+8/roxaYEB1Fz4Kh3a9BTzeyBa?=
 =?us-ascii?Q?MFUdaJrahiJYVf9hRiNCC4fee91vy9e8TLnym8nGQRqJlgHEHOR0ZbSjzO64?=
 =?us-ascii?Q?SxAJVfKPEV9rCy/PuFPeOzZrlLms7E6V8MSwsBGb5w2e0qOwb9YZDneBh3u/?=
 =?us-ascii?Q?MqD5YAfiUmc66bBB055T0IIA9+tbOlUoA/pI6UArVnnCKCLkgoxlFwaQVdKD?=
 =?us-ascii?Q?AtbyOopD/Z3Xoq/Hu85MZvc7NAoP3N6MJfTCqAw57FTm0l8rvCQGGVrFUIRX?=
 =?us-ascii?Q?v1ncKsAvl0BpUiz2AAGaCxZnY847QPssWHVr9Z/Dg89g2l9F+efjX+9wn4X1?=
 =?us-ascii?Q?sqPLqeILSFLCCxYKYYjE4u0cQirpydFIdPsSOVCneNfvMGHz2bnaAGmx0sDn?=
 =?us-ascii?Q?LwT7CtNPxhWJzn9KWYrQjmxAclj7391T912vEIL3cM+Z+fVmqheB4/gFUVtj?=
 =?us-ascii?Q?UBTR2zYOK8PvZJ8J506tz6JV2rsxsFV9QDvQoNNxjrJuvh/4V3GTNTsX3Ppt?=
 =?us-ascii?Q?FNO540WE+IrxdviHe7Of0Fj1eeQQfOtvB1g+evzPDTDljN2ibIIEZy6TjGWM?=
 =?us-ascii?Q?lBvbfOqDtI14JuX6POa3A6sckkkkKFKSJYZbculmAWVjGe3bzWCJ3RkC7XGX?=
 =?us-ascii?Q?xYb/nS84MMD/Osx9W04WDL0WiYArz8OS4olQ0/9WBsMRBMidQXdENQ8tnXGZ?=
 =?us-ascii?Q?cm2iWnof6xfrEaCpiJl25D2/7qO+eIgghCCjNyViwWp87hViMxxQTAAGBqMe?=
 =?us-ascii?Q?vSH6pVLWF02fMV80Wk6vlAHNHO0MlErwPYG+rMxs0qguJmH6rNY+pTry1vLX?=
 =?us-ascii?Q?7zuVx+3vR3qmegFs86dZmMrzjqnjn8XWI/GF/OBbTSDrDi+j1gzWI6EosWu3?=
 =?us-ascii?Q?/51SAbgYM8Pxc+w1B+M7MyCn5mg3Hs9PcRSmBCp0SMVFQFyVaogfx4EK5vv7?=
 =?us-ascii?Q?isotYhcnFK0+ZC3QjgLLUds1Pllx2Zl2p0EIxRlc7eMQRd5pQVfaA7NF/fz3?=
 =?us-ascii?Q?djuk69xtTB8AFxW7KmjAc/NMv1hCBhg7FXVGjwy7WlZ5WqLzKKeew7ANUGUl?=
 =?us-ascii?Q?1A9chzJoMIZAy1gdeLudBeus2qN1SHyyNeHiUqbd1TzwuzaYwMT6VxQ8k6ST?=
 =?us-ascii?Q?kR+t2qRmOMm27km9fmE3WyjBjm8+kj0aLHX3TUTxjZjv4HpnfCm1xRCMQaAj?=
 =?us-ascii?Q?PdNgzy2va4j8cqu9UvKG+oTqF1cp7nDFYD/63p+/wPmy7h9SHkJUSYgkCsa7?=
 =?us-ascii?Q?mB2Wgo00Wf2qgVkIY0fpNw+itrTO+y1hHz4R1UwTf3ZJEASxlqIZUUUkwGvT?=
 =?us-ascii?Q?zPl6wqoqYfrCpNfWukiKJl8vTah5olGsmyAgCULpJTj7VXCN6YOL0FQStxP6?=
 =?us-ascii?Q?+g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26739087-6e42-4d3f-893a-08dbb91c3c1b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 14:25:12.4205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R2Bz50jVdH0IBixc7L7aTBX3P0Us8YdWTElie8aI90J4m6ktVysL+WNTqvq3M+vMDiDrkFaVu6JYYAZEv+GpBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7914
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 01/17] drm/xe: Fix array bounds check for queries
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
Cc: kamil.kopryk@intel.com, filip.hazubski@intel.com,
 Francois Dugast <francois.dugast@intel.com>, jakub.chaberek@intel.com,
 effie.yu@intel.com, bartosz.dunajski@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, carl.zhang@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Queries are 0-indexed, so a query with value N is invalid if the
ARRAY_SIZE is N. Modify the check to account for that.

Fixes: 22504d560287 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index a951205100fe..e0c2203e428e 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -381,7 +381,7 @@ int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	    XE_IOCTL_DBG(xe, query->reserved[0] || query->reserved[1]))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, query->query > ARRAY_SIZE(xe_query_funcs)))
+	if (XE_IOCTL_DBG(xe, query->query >= ARRAY_SIZE(xe_query_funcs)))
 		return -EINVAL;
 
 	idx = array_index_nospec(query->query, ARRAY_SIZE(xe_query_funcs));
-- 
2.41.0

