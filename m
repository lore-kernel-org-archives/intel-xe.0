Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C82CC02183
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jan 2025 14:46:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BAAB10E713;
	Wed, 15 Jan 2025 14:46:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FPlZyVJz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58D9E10E728
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jan 2025 14:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736952386; x=1768488386;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=d4FK/IeY2Gx+Lj5sMw51rHfiNaroQn63u49Xy9k01q0=;
 b=FPlZyVJz07Xtipm+0I5tdM1Yk1srPe3MXKZngcWCkIf6um67o/MyiXBq
 Rd0Fa8KdQaQOcJIqUDiKKPnv4rfVExc6+n8C21xreVx6NrjF78yzWh5eZ
 jky+wHr69aLj42RwScUHHmMUA3Gl/jQ5Eziez/9KF32Pu5h4GhEADnWH6
 BsqB7USogdQgAax1meOdO9skVNAbEjdZedbGVBkLgj25uRNBYjDCEixFO
 bbcad0yNvKpDq8lPYaMRooJ5lIHv1LmhDhwEF/59LQKI96VYsPcthNWjl
 GNa2wQMvYE5DMBdm2A1c6oQySVeVQzfw3XXDAYwWajw2qsXGcyuZxUix1 g==;
X-CSE-ConnectionGUID: 0wCJnS6tQT69npevofzuUA==
X-CSE-MsgGUID: Vg0JZKmRQOyCHV2ic1Vj6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="48685482"
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; d="scan'208";a="48685482"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 06:46:18 -0800
X-CSE-ConnectionGUID: dZeceaabT76qkNJN2nLqVQ==
X-CSE-MsgGUID: 7h4A53utRG6+nej1SNAtNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="142428657"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jan 2025 06:46:18 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 15 Jan 2025 06:46:17 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 15 Jan 2025 06:46:17 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 15 Jan 2025 06:46:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aS3fl5XTt7DlhfuUb/jeLXs4N02v+KgB5dYkXvpH52vTHErMrpk+PWhu28DljcsiJIENUjN8XJ5lw0q0Tirf8D7qhixDQbLw+UT5ENjn4cSreG7jZyvrzQvQNBvlNeXSplu6XmRScqBXlEmmQTXJGEcPmP3vH34I86NjPdopyQzinpVXtgQKLKqpOVtjnNwkOYRBM1s0uqhStLEWi0iJY3MKqr2kmh5P5R0yzGyNhUT99u9neunEFLE1Yb7gSIXLCvW3ymeugvL1q3zVoLgMED64jJR7qinN+Nh8LIdUEhXk+yPGNzO2gL1MuhpFd9QPaGB3NMMxFeJLzG4AWheV4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjDMDcbIB9yJwpiGA/55YdpFLcR11l+t6GYcDKrH+t4=;
 b=EExwaZoh1VupfgEvwFaO9YWalxofRrNilNMZndm9X8oR2dedHUEWeDL2JwOWK1dfhwxlCRM+X0hOQBklS3Yu5PHLgXeYLIDeAlSY1Vq+M6KHo7vuMAqQ6Z/at9R9KlGn5TX3n8OkRp0XshY9E1ckdN4wmoASAAYsYGDbwgcompPRl45WJ/LhX7K5uZS2GOF0CcDN3awg9SmCF6YUg9/2UFRMeGbAntg0dLgCMY1eNuBHNqp2NkJ5pa41xKZn1jzhG0/I1eKfbuRBU7ulYc1WIkvTVoLQTwsIPZ9qtW3uZi1U3m5T6GhA7bUVDdnTab7uzpi508fxTfl5y3C14wWPOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by SA1PR11MB6784.namprd11.prod.outlook.com (2603:10b6:806:24c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 14:46:13 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 14:46:13 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [CI 2/2] drm/xe/lnl: Enable GuC SLPC DCC task
Date: Wed, 15 Jan 2025 09:46:03 -0500
Message-ID: <20250115144603.1141375-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250115144603.1141375-1-rodrigo.vivi@intel.com>
References: <20250115144603.1141375-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW2PR16CA0063.namprd16.prod.outlook.com
 (2603:10b6:907:1::40) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|SA1PR11MB6784:EE_
X-MS-Office365-Filtering-Correlation-Id: 0192663f-2ddf-4c0d-1e53-08dd35735bb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vLjoAnOzmj/JUStuxp+/a2quBT4L/XqnNPCZSNos2zxfrgmZPnt55klrkoXu?=
 =?us-ascii?Q?KOUfjmncEuO8oiSNREnim3TB175btHHnMY5JQXz/hJ4DktgZg3Xyn97EMzTr?=
 =?us-ascii?Q?Zx6p1Btk7NQGgM4pX5xz/R9NSsmOnHQMA1/N4XBtSGWiMaPOUbnB/gN+Q0jM?=
 =?us-ascii?Q?qflJl9TS3uoGIL6WT+gHVa6q00n2FRGYnNJMGBgpd2LTXpxNnbW4Pso3SQ7y?=
 =?us-ascii?Q?DRUbsXt7j8qMxyjlkhCmKIgOImLDiMoIqFvL3iGaVfiR6KdaQ3wjBVR6rVsF?=
 =?us-ascii?Q?CGfcktpi7wiILrH5FSbI47vn3E2WETEl/uDHYBH5NrPPexx/U7A4Zbt6/p+8?=
 =?us-ascii?Q?yrCGbw0shzo2ViyGJXG1/tkJo7/Xp+oLwWvhDJPpwNCf5rCNE9tsCixlsLdP?=
 =?us-ascii?Q?nVWMp2Gh2QuamuFMzlrwODHJLPv9X6ufpMqCSDI4GBhwZr5rsKGB+fMOqWZj?=
 =?us-ascii?Q?TY2c/vjAdJlQ654pcn9CK6hosfN7hhrCCS8m9NrjRHwidIBxlgcCrIjsqqY8?=
 =?us-ascii?Q?bLq2HSX0VoYZWb+gdn+kDRlTRM4Y//BfDa9wVtD2eQiAunp/YzMGY1AlQqVL?=
 =?us-ascii?Q?/KT1MTslonaz/ESjCkSQ7LYoWmMaikQ0/u57c1P9AAOc7nTH6mNYwmcksCkE?=
 =?us-ascii?Q?RJQDryPZVlOHAg/6F9uXgmFDYb3G+1lLJQimMIyEPXlUVWgXbkHDlqV29j+p?=
 =?us-ascii?Q?1QTZ8/oRs7dcLlK9USKpTF9xPeU23tBU1q07sZX1DNkXr6iFNcZj4YS6CwKa?=
 =?us-ascii?Q?E9JWpWvZtKns7HrHvNpXh1QQKCdoM+bzm0KZkhloiQPKG9TUlW865VbW/4fA?=
 =?us-ascii?Q?CpwEnPyMzM0WHIJGG2ld4F46XYfZGRKRvXv8Sj1LUuzozMpL68BPJKChBX0b?=
 =?us-ascii?Q?+5NiojcTAHkTFSAxF0i7LLsDLOeXr9q9gGwQUEW7beYGV1kLlNIWLgV3RZTt?=
 =?us-ascii?Q?4K9w2DGHQMPHhDarE5TcugizxqgC+vmfMA2GeXEo/tBaW+KnW30oOeC7bHMT?=
 =?us-ascii?Q?FA794wMKzsl2SZobaRBUl+hrsaSpj+M/5fH/PB7474cpGt4oRS7FJKEC+0lO?=
 =?us-ascii?Q?C+EbscgztlixTlEpW9GO79xVh02QRkpjJHWBDctIqbHjCsuk7gSJU5Wz7VXk?=
 =?us-ascii?Q?JzjYrn4sbPeB3qe/1WdslTiHn23fsP+dUSv5AClsxcYZIWPfTK9JVCA5rA4G?=
 =?us-ascii?Q?GEaaA8T/E5eBhmCikhU1/J0VfDBpXVIZFN+NT+9Np9RfEH41b1SPjTTN6wfj?=
 =?us-ascii?Q?KmnvtBJp6dV1pWKzRdCQX7XD57vHNRuPoN8tOdVfjVK2ZEDdXIePgjioIu2t?=
 =?us-ascii?Q?WY+Y1WrjaUFZYok6agVLRtUZrm9pZIkJkc7NzBURWtSNBMx4P4opSEcpUoSP?=
 =?us-ascii?Q?57nORTxA8fMTcYHraQVuAv6LBScp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?riodXtJCoTcRCUATokmOzsJ+UrNYM2JgDYgFhvRS15JOrOAHYD3t7vux8MxO?=
 =?us-ascii?Q?/pW9ilye4q+KVvIu/YvPXWCnMHHSm0xD2ibSJ+qEEXD2hCsodN9vUFdqaKT7?=
 =?us-ascii?Q?2Rwg6HOn6EIR3rVPQeTumtd1IFpXUkdBg5zc7HBzbp9mj31iPvRjpCGJyxAG?=
 =?us-ascii?Q?IhL2haLim++1/LCJ8UJ3eZ4QN1QwGl+zhGtg98lEYeBWUnuh4pSF5pNQVFjR?=
 =?us-ascii?Q?/httef3sqo8w97M3Q3IXsZgpnr1aBHjOAuNkdoaBGrzdoZ4Es+kBqxVTfq4U?=
 =?us-ascii?Q?+7WxBKbfVAEIdTEf6xzm7hOhAevznnwO4nAWZLyDwSThqEzUKpBZkN1D2h4Q?=
 =?us-ascii?Q?q6nR0whD6R5Z3vqlB79uYyCLuAQk2FtOeQ9lTJZqLtGZFa7QjKsyn9su/Zag?=
 =?us-ascii?Q?DYWmXALhK6F+9MJjXH8t2XhLxvYidjsJWeECViBov1BqvIKcc+pBB50kvKSa?=
 =?us-ascii?Q?bHxA+09Ig1bJnHu2qB6mgCj7B+ckYTf3qhgSpXne71xhptYNE5AmhbHri+89?=
 =?us-ascii?Q?mwqku3o9cBlvuLSbqEpEDhXKxJqEGcUocWn7hc/LYl/MYBSbrG8npnkgBFlg?=
 =?us-ascii?Q?xOIcpK8gSzch/IjVDGoYuY7o4b7POvGo1e0a7MgZvpVGvzWeMg38DnkCnhon?=
 =?us-ascii?Q?wp1kZUf7RNq+F+KM5r/mouJwhec+XkeuShQcNL/Qj2Sjm7MtruhWgCyf7zfQ?=
 =?us-ascii?Q?JNmQU1IwiyLRihIWi58B09WZVUrCV189nRyPkWsb9J/oKTmaB3CbWFi/50u6?=
 =?us-ascii?Q?MtkEje+8glYubAJSgriPHJXKu4jkMksZxnB4oIzfVGe5RR1gfj3xQ1enPS6l?=
 =?us-ascii?Q?pWjj4/Ca2MkPurKXwMA2GIQYWOVctfXKnQoRq2n7ko4rLqwwdaN9HOVmtZuy?=
 =?us-ascii?Q?ZDIThX0FMoqaAtYysYz7tvLk8WXXuCUglIHx3TKOPoOFqAsN03VWn+u/dx6E?=
 =?us-ascii?Q?TnNzNUz7nkxbdAjvNmiKAzuy9rywQsRfA+5J4vPWuWE+pzM2dpCwwJeHZlyR?=
 =?us-ascii?Q?wfmDXi4NrRGOWDjS69qmwD698LyJ9ZvUDZfWRK14Ewj6p5+gJSdUNinC3fVm?=
 =?us-ascii?Q?EmiontsSnSPfVikZogYP5HxdbaZV/5RZVp751O5LSICFDZtqESwg0R5Y/PHV?=
 =?us-ascii?Q?FHdT3MnfVOw6Z17CP7FfSqi+szTdi25zc5xy0/d+ZmPosQyvxD4/LHlzfEXa?=
 =?us-ascii?Q?6FI5FwTuFmTcFqM6h6dGaQ7j703iJScUGmTUS4Xau+r2LZzutEh1cVim09OO?=
 =?us-ascii?Q?IjSg4fNXZFIHFdNAnNq2C6od99DXUcYJqCoNaTUU+4CEasxZf5C79lIKGfwO?=
 =?us-ascii?Q?NxbQO4GYfYSidamXX6dKBqFQmMLTTURcme7EmbuKXz75XpsekJ4NGv4TBahB?=
 =?us-ascii?Q?L9w+scGQSr/tN+ejM4U367tcBdpcPpmyKsEW6XkfjAJCIpVthHOzW2wbJPiC?=
 =?us-ascii?Q?Lt1qQjwoQEOEgG7cWWQMEAdmBe/j9Ni7JlvU5hT4tq72C8BZ2BU0olN6BE3C?=
 =?us-ascii?Q?YQJuITDg9TDL8o45lc8BA+ZFXZfiYt3qeNdWe1NrCteTf6haUScK82h9j3hT?=
 =?us-ascii?Q?yQEDrIg89zFORwPBA+9N2mi42WCNVw+nTBRHo+Kz8gBSvjqfUhSljujHJNFP?=
 =?us-ascii?Q?gA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0192663f-2ddf-4c0d-1e53-08dd35735bb5
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 14:46:13.4301 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rIPH2o2RCLs3lBSy1AmH/Z6IbQCu6Pw3LZEvYvZazHYxUTGolOniDe6dnuVfg6tIC2ZnoFegl3O1shnZUF+NMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6784
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

Enable DCC (Duty Cycle Control) in Lunar Lake.

DCC is the SLPC task that tries to keep
the GT from operating inefficiently when thermally constrained.

Although the recommendation is to enable it, LNL GuC is leaving
it disabled by default on LNL.

It would minimize the GT frequency oscillation on throttled
scenarios, which could potentially reduce latencies.

v2: Move set_policies call after wait for running state, so
    we ensure it is not overwritten. (Vinay)
v3: Fix English in the commit message (Jonathan)
v4: Also set disable to 0 so DCC can really get into effect.
v5: Avoid lnl_ prefix (Vinay)

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com> #v3
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 43f9617baba2..864fb858dbe3 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -993,6 +993,27 @@ static int pc_init_freqs(struct xe_guc_pc *pc)
 	return ret;
 }
 
+static int slpc_enable_dcc(struct xe_guc_pc *pc)
+{
+	int ret;
+
+	ret = pc_action_set_param(pc, SLPC_PARAM_TASK_ENABLE_DCC, 1);
+	if (ret)
+		return ret;
+
+	return pc_action_set_param(pc, SLPC_PARAM_TASK_DISABLE_DCC, 0);
+}
+
+static int slpc_set_policies(struct xe_guc_pc *pc)
+{
+	struct xe_device *xe = pc_to_xe(pc);
+
+	if (xe->info.platform == XE_LUNARLAKE)
+		return lnl_enable_dcc(pc);
+
+	return 0;
+}
+
 /**
  * xe_guc_pc_start - Start GuC's Power Conservation component
  * @pc: Xe_GuC_PC instance
@@ -1037,6 +1058,10 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 		goto out;
 	}
 
+	ret = slpc_set_policies(pc);
+	if (ret)
+		goto out;
+
 	ret = pc_init_freqs(pc);
 	if (ret)
 		goto out;
-- 
2.47.1

