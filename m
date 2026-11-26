Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED66606A31E
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 10:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PngrhEwd;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=gdfzQC2C
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2FF0112293;
	Thu, 26 Nov 2026 10:08:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86356112297;
 Thu, 26 Nov 2026 10:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795687706; x=1827223706;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=JJw6LZO7BmcIlsLtK2RPIjATYXoP3eqf5rnuvFRz/V4=;
 b=PngrhEwdvwAR5xdoXxjC8+z81LAV7/9go/CcpxuF9c/+mVbOjG9Sfn+L
 nWqzU9tdC/siMQLEfqjRCIw6UhsbBB8ys1zL4FF8duVcbRT94Kexvyqbe
 sD09KTEXPn1r2RoCdegJZAILU45SjDYKI2AImOSqIJKyzuucN4TESy0Po
 L3fe34bzpZcUG7gtDSo9x2/xmkpAFyTQPK6F3hoSHtywXmexYpCDoNE0g
 v8wZ7cIMJG2pOFhc7NqwZml5S8SzFSc3gN1H/ZIFHDLQU50asZvhrib3u
 2b6GDUPTPbkoiq/LLrVe5augpdRoUG2q+JXJuEHAnOvIxKbvhr2nIX1XX A==;
X-CSE-ConnectionGUID: GCN6/lfhT/KGbkS9hMIveQ==
X-CSE-MsgGUID: bVFfJywwSA647utZgRAKCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4434823"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4434823"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 02:08:24 -0800
X-CSE-ConnectionGUID: twY42MXARqS9ExkUa1uZww==
X-CSE-MsgGUID: fqyBS1x1SoeJcGqaENDz/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12432774"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 02:08:24 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 02:08:23 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 02:08:23 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.47) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 02:08:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BEUiBWKHNP08hIJgaWwzOuBh1igLPFqky/5/kB3c9UB20PkYI4HOO5aRorpxqSWiHoWogQp/KTtTLA9RsAE5tYybBR8Ql9xMRhDZ6pWBTPngQPkibPtfZsmrSjnbPEY6Q1WZDCFbz1houZuOcGis5uA1uaVXUIvc8Yw6CX5GmStBwCV3KLNI24r2D3/g4m7lafo8JR4s+AlZmc7kpBWCEeKRTJCmneWp2+PydBFpaiBheLgL5++3Hiy0yCh09Nwa7L4zJn1a7Cvq5iT0xBHY/7P02w5BcsUP8M51iRjSjT9H69Q5IdkrEn12ffEcfbvY5HuBqsUfn+Meq9JpK5vGYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ai+D7yVwX3shiIOydEmKj4+xhPxZI2X1miGmUC55fo=;
 b=tdBrlVe/bnyrgkgSKGxZ7vYmhYcyU1glW4ozk6SM11Y0/u8M0BYRy9odgdXzXeVJVxyub/aa9Y6wSxglfr6O4SzVad6iIOqVGihab62odkJqJELbWGivOT3A5LBpYOc40kKbuVldhQf5q7+mZcC6IvTnO+8Q7SpAe6V44WfBOe4EhJqVqKaEmQpJtWnXuF7mTWMSmnZPvi9rMZu/G6OKanYZYKJfj3pRx1SpwhlUOUeRuXFMFXqQFdGi3lgML7RfqFfm05Ye4YrZ0A+K0suEEIC88ztxUOBamN5YNAvIpz2P0N5asFg4iDO7731e3Er/84VrlT7UmoPTEz0JMqTr1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ai+D7yVwX3shiIOydEmKj4+xhPxZI2X1miGmUC55fo=;
 b=gdfzQC2CMj8AxT+KWxw/3R1E/HIrQ6kA7GHvKopUL6YxWSj4MaHMZQOtyWiruGNzUj2cZVTcKksoBNZm2D6fGohuHIRb5pDeJ8z34Y7kY9Qju8gN87kv453s/aqywkNLo1I/F3m//0SwH6jFmRJ5z7fHVOJ8gwhiITvmiRH/orc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9273.namprd11.prod.outlook.com (2603:10b6:208:573::17)
 by CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 10:08:11 +0000
Received: from IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa]) by IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa%6]) with mapi id 15.21.0662.001; Thu, 26 Nov 2026
 10:08:11 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: [PATCH 08/13] drm/i915/gmbus: Add stable DDC adapters for the DDI pool
Date: Thu, 26 Nov 2026 12:07:48 +0200
Message-ID: <20261126100755.1252635-9-imre.deak@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: b5f94955-bead-425e-0d4a-08df4ba52d55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|10067099003|56012099006|11063799006|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261022075727099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: HaQfKT6uobW3E79S6GISihnJNM9gO9Lf54g23xIaI60kE3EzM+NWOL0ST+aXqlHTcQTQeXU9FwXVcpLTH5jqApNiDKRjiK7EwOR3X8O99rtlScNyjJaedxhlakcoH/EoPBSwxnoIMj+d6rwfAbG9wAwdcwrVzO/uscebXdvT0KV8THr+M/jPILQPjk9reQSZKiX1UmZHHXE1lH/UBi/esjwO4d6f0Ls4JOZJbZMB7XPDb/eImshNMjblD8S++9ACSoBCwV2B73+MIyUC13ba7sLCS9e1SYrXfe5u8KfcH3alHzt8aG0jTntBR0IQS8bdmsLIb6rfrLjfMyQ1svDl9f83vtUv1QDkLKkLYpHbMG/G9YjnqNhze6poxyL5dBdI/pG9SHDmPrVGS9ChAcogteudzSa6sPJRsQH0mPdkk09GRmglwg6m8tcEVtU+kTgf8nX9zi9zfPamJnVoVUhQni2BO2LV+/PPuysW4zmM9DGi2dp9hfDm1kY75kykwD5bkoeIP9VIDc4xI31NMriU/+FLfOPoPFaK8Or/649/6VlQshBP3/w93fGm2WJkHZvYIQecx4kV+jROPy6Z5xYF1ojPpFga41TfHzx7SCRi4FP3/UqiXY3T8gVBwSWM5SPC9gaDWNL65cMdY7T1qVr5d7SJ0JoWl9MqktWEaEf8jcU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9273.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zzuNEE0z+whZi6sO4ZCm0e3904yk8T0i43ba24+PNiH+AJVf/L5GS/3vNbvs?=
 =?us-ascii?Q?BsXsl9i9USLj7J1v8pWhJQRvTlNhaB5qlBHUCSr/Ca13p8s8pTfrcsJ6kvwC?=
 =?us-ascii?Q?Ewyu2ZGxxSmJPVo86xanQTtSGrn07sO+orxJKTDyPaBHVoYyMtHpu8ZEbsrv?=
 =?us-ascii?Q?75JX0DHY9F+wRjBLxcMBF6ZJiFxxFdf0Tn0ZqxIHu2mLE86SRBg/ehVIXl/a?=
 =?us-ascii?Q?z+1NRBrOdpLzGG0xgNKYxMJ+OYp3NKCov8SwI3hB9dOf5Cb/CkzUanjL+gP3?=
 =?us-ascii?Q?4pEEY0UTZqw3jaiprGnMDPa0t4EELNBixFhYpiPpN68fgdS5lshu6zvufAyX?=
 =?us-ascii?Q?+ZUtJK9GXHCfR/nttZXgMF6blWhUXZ3sv88EXGV2OV6s7yu8NNs87WzKYJC2?=
 =?us-ascii?Q?mOlSyYjgKuE8WTq97Sh4hLoln/zDuMmZnBd6xhDpaRUKG0sxyU/+s4uR+4cN?=
 =?us-ascii?Q?chaWiitrz5NiuESzLjVMTlNf6rue7optEjZcDek8SjV3l9CDsA0upohzq8vq?=
 =?us-ascii?Q?9BhECmz3maNRWCtN+LnE2OyIBMdz8O1MLsfqWxIERtG+1HlFJAG0MI6MBln+?=
 =?us-ascii?Q?VTrTirCoJNWHub1XRGWE1QkstPhnZFd08AyLaKDhA4ihu2PgXOX/T1iZ7/qA?=
 =?us-ascii?Q?YYjLkqwx+u1wVIH9jOqpQ0I32PN1jYzKpdZoQ+OZtHbeqTsEuJgp/7zSA7hI?=
 =?us-ascii?Q?w4j9UEFJ7og457Ds+ryHrArTYIgymXn9r8OrY3bVlX/sjjIV2HT9w66Bk/f8?=
 =?us-ascii?Q?1/BA+mU96WtfsIbg0C3pkRrhImNnhc34bVKrsgZW53F3Mq1NG9EJhZ2obcqX?=
 =?us-ascii?Q?+fTwHKOZrKfBVZYKewN2+o7IfSpek+l3FhVnKokZxcgC9bFrzOmAA0lNciSS?=
 =?us-ascii?Q?ek+4/0yi8dTAuCSJv2T8UcZQAxP6h6OdFdsqimSwUwU80cYSkNjZU0T8S1aX?=
 =?us-ascii?Q?GS9syMjyySVsXGooYdk/5Qa7ft5xQk4qpIP6z/dtaal+C80yFGcnCIHHR6sT?=
 =?us-ascii?Q?e/pqiHKDTNy3+dOcuQ+AZX6NOAM4piABnIfIpnBQXqezAJrEId9r4pVp0yvF?=
 =?us-ascii?Q?Hp5+60PtThj35a9LpKN6RgJASU4BrOttfgadT4VMALaDJZGlYy220nrPkdKf?=
 =?us-ascii?Q?QDp8SSCqE/2XHraZu340brq/gxOxOCB+4Dd0rG/C2YML+tHxufKY9ObTAgun?=
 =?us-ascii?Q?SJXMgQQ1ZOgIT0SprmkayZJyp7aSe6utlYIfdXK2WSfQLpOhW8+WDr6DU6Nt?=
 =?us-ascii?Q?7wlSgmq2yPFI0nWYFlBt+6OBhK7cL7k6hRko0J9YpPIQKkyrBuVnhNMImSdn?=
 =?us-ascii?Q?1bvxYLFQAO+e+n9LNdyhhrVbRgzktmBn6LZ2yXg2JSlLrkLb/b0FTgByoe9g?=
 =?us-ascii?Q?EfPDn7DdBbzXC8IPq99uVgARMC1VmR45AVWRbVM5IIh2H8ir/PlLDWyT0B3e?=
 =?us-ascii?Q?dijYcuNxE5f1zuqr3qGSOQ9Esqn771DmXoBC2gVWJPFjKOhpJDrkMbi+VIQv?=
 =?us-ascii?Q?4mwZS26Y1rZ3aSpB56zlfyrMN8dTqmV0I/YEsLa2TOZvd83gHd76pJJ8RwZe?=
 =?us-ascii?Q?ZBLn7gThBVCc7T/L/3ArmjsLmBinu8vvVZ4bpPOFFb6IMCerUJ1mQYEvRZp0?=
 =?us-ascii?Q?FY6qIDIrATWasC1uRus+HNF6Q3wWvDeD9TcJsE+BPDUXbbPqWVi4o82eSZuI?=
 =?us-ascii?Q?/GynfXWyCv1YVlFxMTZFR7pgRaFPBiELQImP9AvHH7TCJrojcpDrnQIGawSy?=
 =?us-ascii?Q?PX8iXXd6ug=3D=3D?=
X-Exchange-RoutingPolicyChecked: h9YhQFrM6ZsOkNUHvVFmM1GfTu84Xeg6bCHT0P7cnwfDh2SlUfDkE4U0JWBWxzWJz3RvFEpLHjssEFwDnaJKbB38iRVNEhrigzU8TDXrJSYuEJtfBFTftlxpplLhlRQeCREgMzKI/WZ9YlZs/lor+Jz6NU0mQH5X2kU0sdQ7keG1F9QzZniAyxtHa0mAZsnOek3erektolgDBQkBJ6eo6NgkRGjHpUYKRxPQlH2l3RsKl8eBkE28zB2N7+IemnLGoMnGEY6XI3lIjIndif4hZ+l/VPDLD6p3cU7v5NkiNcGxLWeci3bp5d2LQzoKyHcFmvuVjaK4xB3Shlxyw4Utkg==
X-MS-Exchange-CrossTenant-Network-Message-Id: b5f94955-bead-425e-0d4a-08df4ba52d55
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9273.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 10:08:11.5117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ngnfSUGdE10Fs4Viz5spV9YacF0cK23MSswIa5j6cA6z7+RmL35PYsWTUz3qI6Ye5cHGKdQXe/KsyXKzBTSA+w==
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Pool encoders use the DDIs shared by dynamic legacy and DP-alt/TBT-alt
ports; non-pool encoders do not participate in that allocation scheme.
Pool HDMI connectors need stable adapters even when their original VBT
entries provide no DDC pin. Add separate adapters indexed by DDI instead
of reusing the ordinary pin-indexed adapters. This lets a non-pool
connector use a pool DDI's default pin without competing for the same
adapter slot.

Keep ordinary adapters fixed to their physical pins and usable. All
adapters share the GMBUS mutex, including GPIO fallback and direct HDCP
AKSV transfers, so access through aliases is serialized.

Register the additional adapters with fixed DDI names. Start them
disabled and enable an adapter only when its DDI is assigned to a legacy
PHY with HDMI/DVI support and a valid DDC pin.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi_mgr.c  |  17 +++
 drivers/gpu/drm/i915/display/intel_ddi_mgr.h  |   1 +
 .../gpu/drm/i915/display/intel_display_core.h |   1 +
 drivers/gpu/drm/i915/display/intel_gmbus.c    | 108 +++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_gmbus.h    |   4 +
 drivers/gpu/drm/i915/display/intel_hdmi.c     |  17 ++-
 6 files changed, 139 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi_mgr.c b/drivers/gpu/drm/i915/display/intel_ddi_mgr.c
index 7dc547a617990..a4a4673dda585 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi_mgr.c
@@ -103,6 +103,23 @@ bool intel_ddi_mgr_pool_supports_hdmi(struct intel_display *display)
 	return mgr && mgr->pool_ddi_mask && mgr->has_hdmi;
 }
 
+/* Zero means that this DDI has no valid legacy DDC route. */
+u8 intel_ddi_mgr_ddc_pin_for_ddi(struct intel_display *display, enum port ddi)
+{
+	struct intel_ddi_mgr *mgr = display->ddi_mgr;
+	const struct intel_ddi_route *route;
+
+	if (!intel_ddi_mgr_is_enabled(mgr) ||
+	    !intel_ddi_mgr_is_pool_ddi(display, ddi))
+		return 0;
+
+	route = &mgr->route[ddi - PORT_TC1];
+	if (route->mode != INTEL_DDI_ROUTE_LEGACY)
+		return 0;
+
+	return mgr->ddc_pin[route->phy];
+}
+
 static const char *iom_lock_owner(u32 semaphore)
 {
 	switch (semaphore & IOM_REQUESTOR_ID_MASK) {
diff --git a/drivers/gpu/drm/i915/display/intel_ddi_mgr.h b/drivers/gpu/drm/i915/display/intel_ddi_mgr.h
index b1793b848c238..0f84c7286dab6 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi_mgr.h
+++ b/drivers/gpu/drm/i915/display/intel_ddi_mgr.h
@@ -14,5 +14,6 @@ void intel_ddi_mgr_init(struct intel_display *display);
 
 bool intel_ddi_mgr_is_pool_ddi(struct intel_display *display, enum port ddi);
 bool intel_ddi_mgr_pool_supports_hdmi(struct intel_display *display);
+u8 intel_ddi_mgr_ddc_pin_for_ddi(struct intel_display *display, enum port ddi);
 
 #endif
diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/gpu/drm/i915/display/intel_display_core.h
index ec02f61a13706..eb383abeabb4e 100644
--- a/drivers/gpu/drm/i915/display/intel_display_core.h
+++ b/drivers/gpu/drm/i915/display/intel_display_core.h
@@ -452,6 +452,7 @@ struct intel_display {
 		struct mutex mutex;
 
 		struct intel_gmbus *bus[GMBUS_NUM_PINS];
+		struct intel_gmbus *ddi_bus[I915_MAX_PORTS];
 
 		wait_queue_head_t wait_queue;
 	} gmbus;
diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
index 8736b39e1ea62..4b395976fc8e9 100644
--- a/drivers/gpu/drm/i915/display/intel_gmbus.c
+++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
@@ -37,6 +37,7 @@
 #include <drm/drm_print.h>
 #include <drm/display/drm_hdcp_helper.h>
 
+#include "intel_ddi_mgr.h"
 #include "intel_de.h"
 #include "intel_display_regs.h"
 #include "intel_display_types.h"
@@ -52,6 +53,7 @@ struct intel_gmbus {
 	bool debugfs_force_bit;
 	u32 reg0;
 	intel_reg_t gpio_reg;
+	bool disabled;
 	struct i2c_algo_bit_data bit_algo;
 	struct intel_display *display;
 };
@@ -697,6 +699,9 @@ do_gmbus_xfer(struct i2c_adapter *adapter, struct i2c_msg *msgs, int num,
 	int i = 0, inc, try = 0;
 	int ret = 0;
 
+	if (bus->disabled)
+		return -ENXIO;
+
 	/* Display WA #0868: skl,bxt,kbl,cfl,glk */
 	if (display->platform.geminilake || display->platform.broxton)
 		bxt_gmbus_clock_gating(display, false);
@@ -827,6 +832,9 @@ gmbus_xfer(struct i2c_adapter *adapter, struct i2c_msg *msgs, int num)
 	struct ref_tracker *wakeref;
 	int ret;
 
+	if (bus->disabled)
+		return -ENXIO;
+
 	wakeref = intel_display_power_get(display, POWER_DOMAIN_GMBUS);
 
 	if (bus->force_bit) {
@@ -1015,14 +1023,14 @@ static const struct i2c_lock_operations gmbus_lock_ops = {
 };
 
 static struct intel_gmbus *
-intel_gmbus_create(struct intel_display *display, unsigned int pin)
+intel_gmbus_create(struct intel_display *display, unsigned int pin, enum port ddi)
 {
 	struct pci_dev *pdev = to_pci_dev(display->drm->dev);
 	const struct gmbus_pin *gmbus_pin = get_gmbus_pin(display, pin);
 	struct intel_gmbus *bus;
 	int ret;
 
-	if (!gmbus_pin)
+	if (ddi == PORT_NONE && !gmbus_pin)
 		return NULL;
 
 	bus = kzalloc_obj(*bus);
@@ -1030,8 +1038,14 @@ intel_gmbus_create(struct intel_display *display, unsigned int pin)
 		return ERR_PTR(-ENOMEM);
 
 	bus->adapter.owner = THIS_MODULE;
-	snprintf(bus->adapter.name, sizeof(bus->adapter.name),
-		 "i915 gmbus %s", gmbus_pin->name);
+	if (ddi == PORT_NONE)
+		snprintf(bus->adapter.name, sizeof(bus->adapter.name),
+			 "i915 gmbus %s", gmbus_pin->name);
+	else
+		snprintf(bus->adapter.name, sizeof(bus->adapter.name),
+			 "i915 gmbus DDI TC%d", ddi - PORT_TC1 + 1);
+
+	bus->disabled = ddi != PORT_NONE;
 	bus->adapter.dev.parent = &pdev->dev;
 	bus->display = display;
 	bus->adapter.algo = &gmbus_algorithm;
@@ -1050,7 +1064,7 @@ intel_gmbus_create(struct intel_display *display, unsigned int pin)
 	if (display->platform.i830)
 		bus->force_bit = 1;
 
-	intel_gpio_setup(bus, GPIO(display, gmbus_pin->gpio));
+	intel_gpio_setup(bus, gmbus_pin ? GPIO(display, gmbus_pin->gpio) : INTEL_REG_INVALID);
 
 	ret = i2c_add_adapter(&bus->adapter);
 	if (ret) {
@@ -1071,6 +1085,80 @@ static void intel_gmbus_destroy(struct intel_gmbus *bus)
 	kfree(bus);
 }
 
+/* Keep each pool connector's adapter fixed while changing its physical pins. */
+void intel_gmbus_ddi_pool_update(struct intel_display *display, bool enable)
+{
+	enum port ddi;
+
+	mutex_lock(&display->gmbus.mutex);
+
+	for (ddi = PORT_A; ddi < I915_MAX_PORTS; ddi++) {
+		struct intel_gmbus *bus = display->gmbus.ddi_bus[ddi];
+		const struct gmbus_pin *gmbus_pin;
+		u8 pin;
+
+		if (!bus)
+			continue;
+
+		bus->disabled = true;
+
+		if (!enable)
+			continue;
+
+		pin = intel_ddi_mgr_ddc_pin_for_ddi(display, ddi);
+		gmbus_pin = get_gmbus_pin(display, pin);
+		if (!gmbus_pin)
+			continue;
+
+		/* Retry hardware only when switching to different DDC pins. */
+		if (bus->reg0 != (pin | GMBUS_RATE_100KHZ))
+			bus->force_bit &= ~GMBUS_FORCE_BIT_RETRY;
+
+		bus->reg0 = pin | GMBUS_RATE_100KHZ;
+		bus->gpio_reg = GPIO(display, gmbus_pin->gpio);
+
+		bus->disabled = false;
+	}
+
+	mutex_unlock(&display->gmbus.mutex);
+}
+
+struct i2c_adapter *
+intel_gmbus_get_ddi_adapter(struct intel_display *display, enum port ddi)
+{
+	struct intel_gmbus *bus;
+
+	if (!intel_ddi_mgr_is_pool_ddi(display, ddi))
+		return NULL;
+
+	bus = display->gmbus.ddi_bus[ddi];
+
+	return bus ? &bus->adapter : NULL;
+}
+
+static void intel_gmbus_ddi_pool_setup(struct intel_display *display)
+{
+	enum port ddi;
+
+	if (!intel_ddi_mgr_pool_supports_hdmi(display))
+		return;
+
+	for (ddi = PORT_A; ddi < I915_MAX_PORTS; ddi++) {
+		struct intel_gmbus *bus;
+
+		if (!intel_ddi_mgr_is_pool_ddi(display, ddi))
+			continue;
+
+		bus = intel_gmbus_create(display, 0, ddi);
+		if (IS_ERR(bus))
+			continue;
+
+		display->gmbus.ddi_bus[ddi] = bus;
+	}
+
+	intel_gmbus_ddi_pool_update(display, true);
+}
+
 /**
  * intel_gmbus_setup - instantiate all Intel i2c GMBuses
  * @display: display device
@@ -1093,7 +1181,7 @@ int intel_gmbus_setup(struct intel_display *display)
 	init_waitqueue_head(&display->gmbus.wait_queue);
 
 	for (pin = 0; pin < ARRAY_SIZE(display->gmbus.bus); pin++) {
-		struct intel_gmbus *bus = intel_gmbus_create(display, pin);
+		struct intel_gmbus *bus = intel_gmbus_create(display, pin, PORT_NONE);
 
 		if (IS_ERR(bus)) {
 			ret = PTR_ERR(bus);
@@ -1103,6 +1191,8 @@ int intel_gmbus_setup(struct intel_display *display)
 		display->gmbus.bus[pin] = bus;
 	}
 
+	intel_gmbus_ddi_pool_setup(display);
+
 	intel_gmbus_reset(display);
 
 	return 0;
@@ -1149,6 +1239,12 @@ bool intel_gmbus_is_forced_bit(struct i2c_adapter *adapter)
 void intel_gmbus_teardown(struct intel_display *display)
 {
 	unsigned int pin;
+	enum port ddi;
+
+	for (ddi = PORT_A; ddi < I915_MAX_PORTS; ddi++) {
+		intel_gmbus_destroy(display->gmbus.ddi_bus[ddi]);
+		display->gmbus.ddi_bus[ddi] = NULL;
+	}
 
 	for (pin = 0; pin < ARRAY_SIZE(display->gmbus.bus); pin++) {
 		intel_gmbus_destroy(display->gmbus.bus[pin]);
diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.h b/drivers/gpu/drm/i915/display/intel_gmbus.h
index 6f05456388329..3c8abc06f1e01 100644
--- a/drivers/gpu/drm/i915/display/intel_gmbus.h
+++ b/drivers/gpu/drm/i915/display/intel_gmbus.h
@@ -9,6 +9,7 @@
 #include <linux/types.h>
 
 struct i2c_adapter;
+enum port;
 enum tc_port;
 struct intel_connector;
 struct intel_display;
@@ -44,6 +45,9 @@ int intel_gmbus_output_aksv(struct i2c_adapter *adapter);
 
 struct i2c_adapter *
 intel_gmbus_get_adapter(struct intel_display *display, unsigned int pin);
+struct i2c_adapter *
+intel_gmbus_get_ddi_adapter(struct intel_display *display, enum port ddi);
+void intel_gmbus_ddi_pool_update(struct intel_display *display, bool enable);
 void intel_gmbus_connector_debugfs_add(struct intel_connector *connector);
 void intel_gmbus_force_bit(struct i2c_adapter *adapter, bool force_bit);
 bool intel_gmbus_is_forced_bit(struct i2c_adapter *adapter);
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 7be5eadcadf03..2622d754d8605 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -50,6 +50,7 @@
 #include "intel_connector.h"
 #include "intel_cx0_phy.h"
 #include "intel_ddi.h"
+#include "intel_ddi_mgr.h"
 #include "intel_de.h"
 #include "intel_display_driver.h"
 #include "intel_display_regs.h"
@@ -3133,6 +3134,7 @@ bool intel_hdmi_init_connector(struct intel_digital_port *dig_port,
 	struct drm_device *dev = intel_encoder->base.dev;
 	enum port port = intel_encoder->port;
 	struct cec_connector_info conn_info;
+	struct i2c_adapter *ddc;
 	u8 ddc_pin;
 
 	drm_dbg_kms(display->drm,
@@ -3148,14 +3150,23 @@ bool intel_hdmi_init_connector(struct intel_digital_port *dig_port,
 		     intel_encoder->base.name))
 		return false;
 
-	ddc_pin = intel_hdmi_ddc_pin(intel_encoder);
-	if (!ddc_pin)
+	if (intel_ddi_mgr_is_pool_ddi(display, port)) {
+		ddc = intel_gmbus_get_ddi_adapter(display, port);
+	} else {
+		ddc_pin = intel_hdmi_ddc_pin(intel_encoder);
+		if (!ddc_pin)
+			return false;
+
+		ddc = intel_gmbus_get_adapter(display, ddc_pin);
+	}
+
+	if (!ddc)
 		return false;
 
 	drm_connector_init_with_ddc(dev, connector,
 				    &intel_hdmi_connector_funcs,
 				    DRM_MODE_CONNECTOR_HDMIA,
-				    intel_gmbus_get_adapter(display, ddc_pin));
+				    ddc);
 
 	drm_connector_helper_add(connector, &intel_hdmi_connector_helper_funcs);
 
-- 
2.49.1

