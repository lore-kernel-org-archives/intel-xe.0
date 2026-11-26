Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15131606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 10:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eaJe5a9e;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=MkIeLU2X
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4F081122A8;
	Thu, 26 Nov 2026 10:08:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54636112289;
 Thu, 26 Nov 2026 10:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795687701; x=1827223701;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=+9oeDL0yDXmpzRqqJi5KEzkwNoQndE8EcqQ4hv3nq2o=;
 b=eaJe5a9eLc330F6niYSumGcWe1siFEn9fSvbGdoGem5Zr3Qs14axoDPn
 JzHAIZpSaHAJ2Nj17VHK90KeOmuRMcQQjTg2083lRh3X4tNXnTwPHvUpE
 SYjcY7Eow7sq2jBbtCCJ8KGQSwzsOKGtk1h8ph4byZp4k1vbf1FnOqvXD
 UySJ7hj6W1HlB63M4JitjmLZTeT1/tiWyVL9dLabAZVkNCwS3ssG6U6uz
 JwtWLsSlJesR7Zs8mI+PGsvu9UvxhnKn/CvzxUZM4wCHPM0Qp+Rf9ODgY
 xfwPeQcsB94dmXtJk2ip+xxAOiM4l+xeEb9n6QzGGi5ysxhRgWZjPGMEJ A==;
X-CSE-ConnectionGUID: UkbsbEDGSBGX1IenCOIuHQ==
X-CSE-MsgGUID: 4jEQhTNaSm+9jn6LL/utpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4677535"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4677535"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 02:08:21 -0800
X-CSE-ConnectionGUID: H2ugGo7bThOMlqd0ziGY8w==
X-CSE-MsgGUID: HdPF8k9ISUun+ukJntt23w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="14169333"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 02:08:21 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 02:08:20 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 02:08:20 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.47) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 02:08:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kF/fVEWgpxf9Z6j3oYpmKSEiJbN9V7N2MYovT5yTZbGTxTEBUXzEZRGzWM68m71HWCfr30SpDGHawYqWY/QKoxOJNaZJcprfScqYxbDCuQ9fMcrI5GB6ONiKa7vXW4J4zBGXrS8D7imrBXBRY6HQBQWq6hQMWXcHOibr/8wiYziN+9a3eDmbLX2v+fnVp+rK+6wn2wb3Zf4vlg3fDVfhydU9WQ/rfxJpRfjFcIeV6+KtNFpMa2KRjIRHaTetngDfGSxjWiyu4cEBnUFN5jpufxVVGprcQF3UhVcd8aWY707M8te0CNyoRF/dA6O1uF1cuUKpwUH38OeWX1P+yeNN5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KjvHzWAUJ8C0Mo7xJqV2OYeqlxRUGXjHf2HWpvjeLgE=;
 b=VlnRjGZ2VzX+lf8UMMA13UAYcxCdd+rEYp5BAsZuzXvf4vMNABtX1Hv7GyWSC1Zha+pSaguIwbJzwK9sR96eHst6JfrVww4OHqQ6iEZLhkKXsEEbnzva9ieYXdpQxrQQqzUBEOf4VIL6Rn9eTsfvqghVsm10Nzb6bX6KrOFyarTwbXMkvKgmakwTd3VOrVVY+1PbBOLaT0z7wltCA4CSGqiXk9sunb88vLcHL0H8vCF8tov5pXhUdonssxizkHsr2iyrRp5VdRx31tZVJlz7J3hWyxLybyAcOqd4TZrw5edWqI5g0MVqFA+kSvna7CTbEo3QZZ5tUr5HCgC34OHIZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KjvHzWAUJ8C0Mo7xJqV2OYeqlxRUGXjHf2HWpvjeLgE=;
 b=MkIeLU2Xlx5ig92EwJmXY9b6PEcSPt1ETm7C/YOUpRA/PMW39ZyBLlyTZGUTK2f8yJ5N+iAOBKh3Sbr5Y8eqyZvD2DWNI9TWaICN+ln0jOJZjxU7hsK+tEpxrMmF5gGXYxiXsVd7000V+lE7ZUOZbcIRqPtWVgAwzU+G34Wfxls=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9273.namprd11.prod.outlook.com (2603:10b6:208:573::17)
 by CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 10:08:07 +0000
Received: from IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa]) by IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa%6]) with mapi id 15.21.0662.001; Thu, 26 Nov 2026
 10:08:07 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: [PATCH 05/13] drm/i915/gmbus: Extract a helper for Type-C DDC pin
 mapping
Date: Thu, 26 Nov 2026 12:07:45 +0200
Message-ID: <20261126100755.1252635-6-imre.deak@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6e591552-05fe-4ead-3708-08df4ba52aea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|10067099003|56012099006|11063799006|261026121527099003|261022075727099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: ZOb6PCbLbmDkLGjoxKZUVT1V1flheM1kqoy7BVF74OPtbTrLjK4oRbx1lLj2/BJc1Wg6T1y1//FT3nCjEuL6feIl+fySg/uSI3JDkFErV/P6wkLsl5d29+VS40kJEyMdagnV++lOQD6en/RQX7f9lScFmbIsbv3PKkkmG0bkXzgrlOXEZVt/QJQPxlmxPJwDLSCoXZcozGpWANNnPBN7gD03Uy2sZF+eXM90Xmzl1lfdLZd/ttaOqhiLW1KVNg9URUVz4E7YWeOFqRl2Kz8b94HS5O9iMyuy0zX2kRhMTHUu0+s+Yc16uvPlORAcXbjwi+QlmQ+0bIsMuPPxUUmzgp64rvSoq8ksPZ2M4u8K0GRwxNQCUMzPwk73NVQh5+XpTEkkS3ALMlVq9SYtmEIvkwRrlQenjmPo4TIg9xHLBl/cRcum9YeFWzGKSXoKDlTn2g+mb5sKiHTt30BgY7/5YlRPJziQ6bo7CyqaLP/zwl5yxq36W1clEx1lE83xjEXxSrUV0QLzLhmwewcLOQXitj9GqMkA8a3nk4Pkc480iPXOlJgreE3ftigScdi+jIpc3mnBhtgTtCCi7YFyaqJ2MOWZp5ko+iER2+IzuzyCgx/xVaaFJ9zLwVslLN7ZDt8qqvvGdq1GMSiKBvM67vbKASUvcQuCAl+qIHwJpcpKubA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9273.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(11063799006)(261026121527099003)(261022075727099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Rad9sa8rm3iT8uP7BMMKJLFt2R/fmG6bfqLuq6JK6FFeK1i8RlrHctrFNvLA?=
 =?us-ascii?Q?K4ErPCjedjc5RLxFC+Q1Ne/LR1ALNukiqA5+uKkY9xhzbYDObKdHRiTIDhb8?=
 =?us-ascii?Q?gi1Zpbw2hEne+keVjl77A8otTv2DTmBLLO054dDYTuI/eq9WEaV8HvjchJim?=
 =?us-ascii?Q?6AEVBkEAzLStK90YBy0HmxRI+OlYafTUc5a6i6qFNDfs4x6KZH7fCqHxslc/?=
 =?us-ascii?Q?MVr+V9k2z3ebQW78jaRzfm9Q4/x5Z3+rOFpwlT9vvbtI3fM2u/IWHjTE/zu/?=
 =?us-ascii?Q?CAacBf3OLWwfC+Cb6mUcAfc93EiZXVXZAHkc0x7bQn2IJmfZFxAweS/7nv+z?=
 =?us-ascii?Q?9VriQl+BkwYjD2p1GLK25euj/iiMZ5Mz8rkgGZLikNOJiR60kZ8twQ6/pzx0?=
 =?us-ascii?Q?T8htKXotFMjj94PUdUbPlSlT3EFDllJLKTdw2J1rgF4pRQFy8D3mUIpcLbW3?=
 =?us-ascii?Q?IE0I2A/CaXxC2DXEB8cVYcZZxKNflUY/IMoy/RyCD9czhMeo1GSZtV4Nf6C3?=
 =?us-ascii?Q?WvqBooUuWWh6N2sUvWyMO7IKf+/+FS0TSMa/WFLXbagdIxPLojylGkiPKmq4?=
 =?us-ascii?Q?v28hrpFyc+gsNhaFXFPq9KTfIJNix+GIx0DqVsn5tl4FJGzga3pCLcUj7aFJ?=
 =?us-ascii?Q?YJgd9+mb1r0XqI1N0X2y7zJIB84xvSRJX7MqB0wfdZ7f4naacuXarV4YChYj?=
 =?us-ascii?Q?CRNITZTocPkhS0hukdNGrpCVkS9DC+5RicdWp3pvkPOazIN5c05Wa1oWL3I5?=
 =?us-ascii?Q?J9qsVnfzPlKKUZZkQalNdwLDV+578DpcgsdczcrmrH2mV/51i6VYdpYcPrGn?=
 =?us-ascii?Q?0JwwiS+P0W1Ka6FTp77mCN1yY1ut/QSmigxSw2HKsSjOOb88vLmIpJi+ZciB?=
 =?us-ascii?Q?BK6g7MS/rH9lDsZDhtFVztrvE7eRtKXXUvakt5OlUQSiC/Qi7OHyuUNA0nMZ?=
 =?us-ascii?Q?8beUT8XJtossRZ5pcF4dM5TOSmbUxzIdKmuXnMFyweWVxFVh3SflqQbJzyfj?=
 =?us-ascii?Q?LThFap0MO/Mvu0E0MUOwTriBdXLuEHz0NO2yuOJ3JAN+jynaib/kzRsbFEzO?=
 =?us-ascii?Q?N1F5G/aUbVp1ueemYZ5K+vSX8qnmTxD9+SC+JwtgGJHnh+u9A1+Us3CzW1sz?=
 =?us-ascii?Q?VsECeztie3+JX6zpG3zW1j0xBV4khALh0J9i9mfhgz5Q130Ig50dG43w0hLb?=
 =?us-ascii?Q?4kv/CKAgkw98HAp+pBZC7CJujBT2M6fpO23pRrgUff6c1PS6Mvmxm4h9Yu1F?=
 =?us-ascii?Q?qzQ0NMWWua0m0A9a8Yc+JQ2NBvrZ4OPruBFlKccLVWGzyfZBKxH13fVmXNHj?=
 =?us-ascii?Q?cpaNBthnsoBNSTXKPC4ityjjFANp9NM8Bpy0idvZkGueA08H2XIYo5IIVmGV?=
 =?us-ascii?Q?/4Ed34KhdnKyDIJdhY7d4rc1wfIofrztno/8k6LzNrmO6tyvLZ6Lxb9JC3k6?=
 =?us-ascii?Q?lgrW0Dds25+0aDkVOggV6bHhAq3N36fK+oD0ul95H8HcwWPpjcxplsE8fz8p?=
 =?us-ascii?Q?CJ2cLn2XQh+PKiRPcw+wJhqeTR/xMycFIRF0smjCPy0waTVfMmA7pFaia2ME?=
 =?us-ascii?Q?MKggwcgVuO1m787O1JJ/hFHhTx3HdzAAgJU+WY9cKLRY2EFiwOxtOjUBnNEl?=
 =?us-ascii?Q?vCwztIhvoNTt8nSJULcWG4yB3qA32z1npg9ReJhEwmN+PhdfbxWbcpG6KqNU?=
 =?us-ascii?Q?T5/Pyy0qvYj4bHBohHMc0Ep/XsCXF2e0QP+w8waLo97DOqVGp/obeC2QNZ1n?=
 =?us-ascii?Q?8T/1E1izIA=3D=3D?=
X-Exchange-RoutingPolicyChecked: oTwXGm4mLa+E6s/cljibmI7gEzTeKjgv83fw6RoitOMGBgk3umbGgQiSt7Aci4yTazVkcXkaB4ylm6LF8b60qrNNvA/yBEuxbw+daxGwJEUVFmFsryO1Hg7m53e8mYGYARyTVX1mxWfdx/xkejsSYHNjEUSuHN8cbA+vWWaTUcbH2lgDz3t3aaTq7aPQrWrwR5N6SN9UObC/N7ginn3cWTIbUEv8+UPpN/vGVVvDb+XQNX5eyk40ix6Eghw5RQfDE4d9VW3R5rxU7/I6KX9b0zw4/JGI7rZEWUnnCbk/H0Wfkp5rWsaO3UWdMvJpkGJeUsAXjDVg5fSHZavEDvNMPg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e591552-05fe-4ead-3708-08df4ba52aea
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9273.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 10:08:07.3599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bvRn4Njq4vhmWxycy4VIrZep3o9TqKI7HPnhSKW9IdkIZu7e0XNOAeP0x7vmoaTuppTXB2iPUD5E9PrGIadONQ==
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Expose the Type-C port to GMBUS pin conversion and use it for the ICL+
HDMI default. The DDI manager will also need this mapping before output
setup, when the encoders do not exist yet.

The regular NVL+ HDMI default mapping does not use this helper yet;
that will be fixed in a follow-up series. This is unlikely to cause
problems in practice, as VBTs tend to specify the DDC pins explicitly.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_gmbus.c | 5 +++++
 drivers/gpu/drm/i915/display/intel_gmbus.h | 2 ++
 drivers/gpu/drm/i915/display/intel_hdmi.c  | 2 +-
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
index d43c81d362e6c..e80822d3e9185 100644
--- a/drivers/gpu/drm/i915/display/intel_gmbus.c
+++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
@@ -202,6 +202,11 @@ static const struct gmbus_pin *get_gmbus_pin(struct intel_display *display,
 	return &pins[pin];
 }
 
+u8 intel_gmbus_tc_port_to_pin(enum tc_port tc_port)
+{
+	return GMBUS_PIN_9_TC1 + tc_port - TC_PORT_1;
+}
+
 bool intel_gmbus_is_valid_pin(struct intel_display *display, unsigned int pin)
 {
 	return get_gmbus_pin(display, pin);
diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.h b/drivers/gpu/drm/i915/display/intel_gmbus.h
index 5c03100ce46b0..6f05456388329 100644
--- a/drivers/gpu/drm/i915/display/intel_gmbus.h
+++ b/drivers/gpu/drm/i915/display/intel_gmbus.h
@@ -9,6 +9,7 @@
 #include <linux/types.h>
 
 struct i2c_adapter;
+enum tc_port;
 struct intel_connector;
 struct intel_display;
 
@@ -37,6 +38,7 @@ struct intel_display;
 
 int intel_gmbus_setup(struct intel_display *display);
 void intel_gmbus_teardown(struct intel_display *display);
+u8 intel_gmbus_tc_port_to_pin(enum tc_port tc_port);
 bool intel_gmbus_is_valid_pin(struct intel_display *display, unsigned int pin);
 int intel_gmbus_output_aksv(struct i2c_adapter *adapter);
 
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 667d4514c375a..7be5eadcadf03 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2880,7 +2880,7 @@ static u8 icl_encoder_to_ddc_pin(struct intel_encoder *encoder)
 	if (intel_encoder_is_combo(encoder))
 		return GMBUS_PIN_1 + port;
 	else if (intel_encoder_is_tc(encoder))
-		return GMBUS_PIN_9_TC1 + intel_encoder_to_tc(encoder);
+		return intel_gmbus_tc_port_to_pin(intel_encoder_to_tc(encoder));
 
 	drm_WARN(display->drm, 1, "Unknown port:%c\n", port_name(port));
 	return GMBUS_PIN_2;
-- 
2.49.1

