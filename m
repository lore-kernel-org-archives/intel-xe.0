Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1200FC47DDB
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 20:31:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D38E710FE63;
	Fri, 26 Jan 2024 20:31:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AFF010FE63
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 20:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706301087; x=1737837087;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=nIT2LrPt66cZDDHIGOXSmcBc6703adtjqBFQdQQXABU=;
 b=CIWUfVsqgLwRA5EdTKRJAWj76iXdIeEZGNqRyVTDC/5w144rw02h3XB4
 SWvTTODMH9PAHQBtrONlsAFSCriuwNYu+CSCAMRNHjCdQDHPbu420KYnx
 wlV3UxrDUEQT7QIBcm2rX+VHhsDzX0fI9K3ThsSVpvVPj2sTESZTNE1rZ
 5BTMgCBwnq4R4b95HPxuT8P9HBUfJs2PUZ3QDEoIL/nL+XN/ugPwfPjJd
 9sZQE0YK6dkpvOyhx2irkrcEnGV9tjFYc5mJrQoLejpiJcUlT7i03kGKn
 ywN3pozCFHg8iIUA73aOnhbGSBYMsrx+EiVYF9UYCFfCK/7F0q+LJOYeJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9948480"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9948480"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 12:31:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="877481940"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="877481940"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 12:31:27 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:31:26 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 12:31:26 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 12:31:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=caUGbPAYYJO0E146xwdG9fLCqqyMcf5j5rhYiauXGRe68DaqyRD10gDrOSLYcA4AMW9qvQICNVa53TJypAhirSV8UNLnqK4T2Wn1FB5CGSco3pin8mOfw6muZxNlOwq5Sf3BO15MCuo67236YjNmGt0t/NAzxd3i9SR1AP5hetKRR29j0OXLX69Ul+rVEUruk18Mm1svjnnR+rf+tvtvBh1bfs7qbwiARfGHcN2lPt6idP3xweAJdbM7jYJl8OUtUYOEC07MPi6P4cz2vNVauuxc1TE1AxiUNlNDqReYo3WwH0Z8TVLI2Eo9yLmyqdoChnjujDixCgUzLCNdFOuIzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z2s+e6+h5RW0xqVGmn+Zhg6kAUJDx0/v1gxOXySZxb0=;
 b=jIX1bA58k1XCwaB83iArkkJogeZOJA7AMcSvPX2U/GbhD78eREarpak7CCOkfSsg7bg5RudLdKuKOpOjf3Wf1iaQrYtbrSXK3okcMy+PVVIt0LMNIKQuBTjOcWugw67L2uDG24uxq1Chn3AAoijZdX0TnHQEt5msrb2N6Pb01Dk1Uf7Jph5Kp+ZBPEQrWBazAOG3SdWLUck9TjXyhRqM/vaiAiDSGuJoWI0Rk/hIu51u8kEGYx1lFRdahCLgBuGzgzFzXGBU2yqW3a42q2CxBOocx6K1XyUfgsyVwYRuoEahkuUBwOAdOzMFfOn0kMVV3nUZHnhPsJAsCKmk+qZrQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CYYPR11MB8407.namprd11.prod.outlook.com (2603:10b6:930:c1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Fri, 26 Jan
 2024 20:31:24 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 20:31:24 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 12/34] drm/xe: Ensure device is awake before removing it
Date: Fri, 26 Jan 2024 15:30:21 -0500
Message-ID: <20240126203044.1104705-13-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0113.namprd03.prod.outlook.com
 (2603:10b6:a03:333::28) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CYYPR11MB8407:EE_
X-MS-Office365-Filtering-Correlation-Id: fff86858-125f-4b57-7576-08dc1eadc3a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qq0rMmumTJEl4/9/zID481i+/ZbhGo8QRKYY/Z6JsAIztUTd2Idnb7537AYExe0WP2o0EgiAIOO9nQpJ+PYTSaBjH42qnTsKDbK+8kA0BOH6XV5UEmTUhekFK33Q0tZqVJAjnCssBXSvRdFeXVc/PotHvfsA0Cw1pPmNXrwNXkQz5dbvBHdJvwx8FhK919+VG6zw9AuomYwK65ENThnVDLin/VnwMbNFfb4HkP/6kBVPiLCzLmlIGPW/5g/4NMEvpPx5DqTISeAo/I3L9UWjKNWcKnQwrwLk1M0CLImup3Hkv8fMedto5yvd7nfH4vW3e8L2J/4hA3c8K6YTl2gziFacL18QF2qkuBlzGLgbmY/pYHrNks8TUYXraXwQ5imPQuJ0it+WVPRqxO2l+SL1xoqLw1GAcB2Q4ZonxX3Gzfhap5ODuhvsOAklYfwr9qPGpYMBqug76ltJ9yDoWRQz+GDMWpKbK8Cwh0qdDOaFgIz9319jjlhVK979TLIL21SV2mt+EQe3r4toJn+Yn4Ru7eYOw0xBw5Y6M9ZNHb8dZHdWS3ZpFV4HSME3ByQKKMd/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(39860400002)(136003)(396003)(366004)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(38100700002)(82960400001)(6666004)(41300700001)(6486002)(478600001)(26005)(44832011)(2616005)(83380400001)(6512007)(6506007)(4744005)(316002)(2906002)(4326008)(36756003)(8676002)(66556008)(5660300002)(6916009)(66946007)(66476007)(8936002)(86362001)(107886003)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X/28OiAabg1vlxqU6oTy5NlcVFV7Lnx00mSLtlnIDyfeoS/Y9bgLoG6Aynp5?=
 =?us-ascii?Q?jZSaX+ATMgRxrIASDqyb2CloX85wcG3qm+MRBhqZ198tXGTLrep1vfwQ4XkA?=
 =?us-ascii?Q?DeV79Zoft1Xwoh7Hxm9Ke+R0hlvenLEY3gKufPARFTG+8P5b2xHje4gkkemZ?=
 =?us-ascii?Q?V6zE3rUUzm4xn2xbwMqyAEHA6Caj6v4aDdEQEjcqIIr5wMMRtbX4u/6kBzww?=
 =?us-ascii?Q?l+6L3bATUn0hEZg0LgIKB21C9/ForXZrf24yG/CajFA7HOhiJzeZl3M7PEp5?=
 =?us-ascii?Q?bjkVfMuf5T70mJnfjfolf+rGFvjp9YztTEhRU0cXQpxQngPnZbtDq6TyYhgr?=
 =?us-ascii?Q?eeCG0+fFR7JT9cC173VNKJ+cR+IB6bRZdyxNS02ay4dhWok+IZgWX0ko8q7R?=
 =?us-ascii?Q?h7WsJPje46LOvRgOJ7cog/QGsBTuVO+8l09XcGt6ny1r9Bw42HWSBlXF+QF4?=
 =?us-ascii?Q?/W62r4ovQice3KVJs5bNmMQRQlXT1QEazIo44O+NkDZtV+GC/bXOFxRmz1tr?=
 =?us-ascii?Q?bF/4t1/54edjwYIGZVAgAY0eke/4lpr5lZ9SqeY0WZ9ZzxiJhH5xWbnBpUQv?=
 =?us-ascii?Q?icoY8B+EGdKuXzcSvNcyNCoE8RkbmS1p2Xyiv6GWIU470fHn2l8KQJADnrIB?=
 =?us-ascii?Q?boYkjZwT4EUBq3iJjiAMU9Gs/NG1gexVttRlnMfCj40o8/InSkN1/QHlIwka?=
 =?us-ascii?Q?mL9tl5p6hg5HIZy6fPo7s1TFE6jHTStXqt5hr2DuYqIu4P96nz9SKR0MY6CE?=
 =?us-ascii?Q?38m0TH6VcnA3Jn5NmXNWTtbs5fgy9Ka103LnFnClzST/ShB1ICHCqbq1I/oU?=
 =?us-ascii?Q?7cWwkv5WHy1GRUD+yIfjaZWtzlkFoqtNwSHESFtAG/TuaJS/ZkCoY7uwzMqD?=
 =?us-ascii?Q?ES/0VsV/aPjeB9kx0gNLRG+vt2h/Pu0e0lE7a4KZijhH/s31ECNr4Slvz0I7?=
 =?us-ascii?Q?gkMEmRMWwFezcr6xQpRLW/4NYsK++FprKPPiU9noOCy9PvNgKShK1WBEMkh0?=
 =?us-ascii?Q?CIr+FQyuGuIEObRlKopvvR4vLjJycG93eSHsR8kC9ZOy+D+l/VQX+pfIrlWa?=
 =?us-ascii?Q?um9U48BgWFT8WK3OpzkY1/PkrN9sOvaravBqstJvoypvCbpTRaABs8hUaDBW?=
 =?us-ascii?Q?cxLmhA4NIjn5f/EgIQ0WM2F/XdP7hQOHG19JkLwbleQAVidF/m0cCpAhmH2L?=
 =?us-ascii?Q?cGdnBxcETUvgz4y6FkeDF9F9V8QO6RoEOE1Jl/5Pq1XM3d7Pbh6Jd/ASfUOP?=
 =?us-ascii?Q?hM+UdGqJUdKaJBuTPm4vJfCa5mIDiduaTvYfMnemR9qXhLYBg0xiIKLTrTru?=
 =?us-ascii?Q?hU9nNcPdooKOOuuEBgqlDDfHvVsyGdb+0i/M21SqZKUfBa0SH9vw1stDhoQ8?=
 =?us-ascii?Q?TFdputtNIHkT0JDPAXkkVlPLIFw8IfJtSxnQ32QFU/eZPyquziWaO+WELEPJ?=
 =?us-ascii?Q?KHB7rjwSeco0OLD++e2DmDepcnp9kjEWlygLvypdvSFs85LxZfKOlIEJDIvu?=
 =?us-ascii?Q?bECzojzgZ8I+s/yPrxRr04I5P8v/2QVHZllGIMjs2BhcTGRIWTaLIcIfyxqv?=
 =?us-ascii?Q?ta5ZrWTof7gxkYDHxxwa1ZmMtZiOB7HfEsK2+2EErHp4vu71iWLoY8cQVwmI?=
 =?us-ascii?Q?QQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fff86858-125f-4b57-7576-08dc1eadc3a5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 20:31:24.5907 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YKn/+GUU+7BjE452GjL8TUzBqSrh38XVENsqdJ34L28ZCPb2wd6NrBJHBOvZmdkIN/I8DxTVe4cZHEQBHLWFzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8407
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

If device is suspended, the module unload might face challenges.
So, let's ensure that the very first thing of the "unprobe" (remove)
is to wake the device.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index df6b3b31f419..0f296df729c4 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -686,8 +686,8 @@ static void xe_pci_remove(struct pci_dev *pdev)
 	if (!xe) /* driver load aborted, nothing to cleanup */
 		return;
 
-	xe_device_remove(xe);
 	xe_pm_runtime_fini(xe);
+	xe_device_remove(xe);
 	pci_set_drvdata(pdev, NULL);
 }
 
-- 
2.43.0

