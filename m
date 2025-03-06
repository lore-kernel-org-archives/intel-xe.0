Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADFDAC282DE
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 21:36:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 716FE10EA92;
	Thu,  6 Mar 2025 21:36:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BUbGpqCR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B12E10EA95
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Mar 2025 21:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741296988; x=1772832988;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=H6XZN9qDqAW5Nl4whw55nAMQRvOC5mgqWH+Dsb6KrSU=;
 b=BUbGpqCRisIQMP0LYc1yp1PYlsemnZo5lroe3Pbaj7oyyULKF3QJCRHU
 bH7+tLoE+7u1P7f8F0FILxIx7hAnCg2TK9od2QWNpkkJCFfoSOms6nUkU
 pkclc9gn+QnFKrF+k1ysHahQvhUHqD0Sp+Q3atHx4roH6HVRCus/MzjAS
 0WWsIzaw+Kg7+ll2YW741v8uxtathHbAlXANrMzkDiihRcTBkBVIJTGJH
 5Y73jIsbHwgZZzgruxdBDF1pk5V33zK6fXEGoMVf4HHi+dACzZehmUupj
 LYe1oXIQe8LEIQvoFZmK+c7eyCg+EVeI2JpLAgmMLQZ288C8tuO2G+ZYK g==;
X-CSE-ConnectionGUID: QSplTLdQSGGA+FJ+2SudBg==
X-CSE-MsgGUID: Po5h0gYHR/KlBk/laApW1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="52976579"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="52976579"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 13:36:28 -0800
X-CSE-ConnectionGUID: ipAxvq3CQz6RVw3qBAaoDA==
X-CSE-MsgGUID: YZJ9lbwzTIO7wsGgsGRKOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119658634"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 13:36:29 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 6 Mar 2025 13:36:27 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 6 Mar 2025 13:36:27 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Mar 2025 13:36:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HA5YdE/JbMIbh+Anwk2n0ZgJVMKLpSDdWiACFa8DoS3jb6sEYQS8NQvZV6urk4p1SKLIvoZaCykbXAdRDe42qR5/191yrb7Z0wtY1/seJgHTPv6zyzkwTjTq9zqdKToZD7j5/fp+HKjNKBwOY51rUu8dZL0sF2FdHDky44n2G78Sn3Lxp3TcuuY7m3E6yMSHO8KZAFAsOkumrwOQUVBpI40aITmetaFaoK/YwoNYkFKGBbog3n7Ax4vFF1+bn6UR2BAPfilFqyPTPYO9UcdzGPEJNvevJcivrWJTl6nvHeOn4an41Tx9UMbQfmmGfqdP2BS5kiQn3pmPHaOyqIYxjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MBPbeSU35luDsHyJ69vbm77OETa38xGXjCUlX6caCA8=;
 b=HT7cm6882L0YOrpHdD+HIMcSrDntGEE+DXFz702kZxfS72ZAcxahxHzrDqRdSfGnOmgqlkgUfi0JWVDH4sZP9mvmBnScT9PkZLEKNPm9VnDeUk2wOCdgR6GgngSUxtyhB2ec97mkwatYVWHyQdIB5ZXl9gBqRS6bljrWOtE5RhUBluvc24Al/NM3b2pfa+otPuHPgzhBcP4DYH1qkG9fNDkn4e7jsmAWup8uVZy7qxqXiYLDSEvNYDjaDfjuy7nG3GeoeH9RymckiiWd9843HITnskgu/5OooMn/lTxgcGw5ynwI50lk25V4eS67cYjDh/OUy+/c2wMmOQIEcPGnZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Thu, 6 Mar
 2025 21:36:25 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 21:36:24 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: [PATCH 2/2] drm/xe/pm: Re-enable D3Cold by default on BMG
Date: Thu, 6 Mar 2025 16:36:15 -0500
Message-ID: <20250306213615.1004502-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306213615.1004502-1-rodrigo.vivi@intel.com>
References: <20250306213615.1004502-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0127.namprd03.prod.outlook.com
 (2603:10b6:303:8c::12) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH7PR11MB6006:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f87d1e6-ec14-47f8-8f26-08dd5cf6f1ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0T/hrhSwGEey3FFxNkPabjEo8QCzXWJzMdiVuIEOItKpyzeDod22SUpLhjs5?=
 =?us-ascii?Q?GSJJvA95zI0EoX5rBrKS8XytkVLiPpmwQXsSa4sRHRTphQ1AjFjUSS5NNVKu?=
 =?us-ascii?Q?HlvCSAxFKYHDf5bPCsAVZSL5Sss6rNliyWk2h8auK3EH2VwAEkxcqZCVc5IQ?=
 =?us-ascii?Q?OWenno3aTQQ+n0QOxqFz/ApTM/Sf+htDyaMSHDMRRleiJJ398eja+cbr4xd2?=
 =?us-ascii?Q?48Ei1yEGyvPXbO25FgID80G9CWDCJeGod9VgG7v2KyJ3G/gQDK0wHI4KUKQ/?=
 =?us-ascii?Q?rDvZq3BipDrMnHCk+bccqAQGk37jMueDTUzcpF+f/ySll8JsnVYWZyk56q8K?=
 =?us-ascii?Q?5otOqWmHvLAH0dlFhv4RManQkWvCHg1N2UXq5UogyaXvdyH/dg90ekd4bszU?=
 =?us-ascii?Q?tTh9NBgToniNoJRq0OcxLpjBXhzjKsCxeRhCbOb9y0MdqTHzuUCkkiNgfJPl?=
 =?us-ascii?Q?kXeRXmu6fJ54YZJmx3r39jvHcYEg7YgCZIJ6SPK2lLH807x7S5K7juUB1vN0?=
 =?us-ascii?Q?lCc6ArOIapOfSPpw5cFrSd5bawvUryb9+wHKKI2Y77eev78k7gkuSXzhlZvO?=
 =?us-ascii?Q?0pFPFePZY5lv+EFRt3MBR7JYFCFMCnFS7Y4eUvSBu0NQ9y5FVrzZva3dQOiI?=
 =?us-ascii?Q?hmkVUKnCjMYx+SNkkamLgQqsvN4LOx4lpxrHH2zrzwoaatQkNe2hhd22F2BF?=
 =?us-ascii?Q?fTQnb1xCH/F3c18Unw92ocHWN0d10aVSWm4YvXF2iuDNmoB2JH8ePadM+vqa?=
 =?us-ascii?Q?/6h6CPsRMMPC0X1u15j/34z6LfnGDvPCLWF0jKBgSmYAM56TMx7hHbzjRyJz?=
 =?us-ascii?Q?BCoGSerzVBzQR/jfeEThtoLG2Awnbm1TvKir3/7+/qPRry94MeGzeO7e2uTu?=
 =?us-ascii?Q?2bpS/8dBuwSqo267xAwN3Y50zRv4ueq65ntOi4VzNqK7J79a18H/A19ZeBpf?=
 =?us-ascii?Q?NacyC1KAAwo3Azgtk7PB2iRk2GbsyHlYHCy8iJGvBUP2+pQ3EJFqwdw6jGlp?=
 =?us-ascii?Q?/PUnAdUvmOEajH94jdSbCajeRYQ0ORamFz2PP3COnrDa8Pqeffntulv0BuNc?=
 =?us-ascii?Q?hkOMLXZ5R4JpWWLa4PedCbm8r25mTasjF588YvrPCZnD3W6sx4bLzcc6KKNF?=
 =?us-ascii?Q?Cdr5s0sDJF8UMATY0b/7yFKHKCSrDTv6cs4EfP7MDdIPQj4vO+Z4n7Utucd6?=
 =?us-ascii?Q?abdMY3nZBfweAtVE4zeyzxdQhrRHrolclirj8u3O6YWNUWFNnW28K7m90HCL?=
 =?us-ascii?Q?WGiTmJ6CU0X3ErSkmisShgSNGXO0NNyFDs59NkS4T7P3zaL0SJwN/9UCzfNX?=
 =?us-ascii?Q?IyYI3LLhGbRfmqBG4I8tNo6nRA9aiHoIb22MPlDp1WRTLg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3SflULH/MLZkIHNiL1Aszf+MdG4Xi2AmMR5XQyqf/TDofgTPUIMG5IR3zfTM?=
 =?us-ascii?Q?+GvYnO6L2LsLHvOHypGvAYm46y0j9gn0DukZuV1BjcXNQp2sm+ptYTenuIKS?=
 =?us-ascii?Q?hxucUBmeoumnoFzrrZuoll8dTPsHxElmZ7waIOTIZCh1zSPe8RNcRUwHlVyd?=
 =?us-ascii?Q?WuoDlVuAm8nNAwDPwwiYQ9BO7N2OTgUBf3/hw5ZtxWCcSpGtWkK729CPRiPJ?=
 =?us-ascii?Q?Q5nNYOqGEGPNj0NZDVP9eojzOY0gOdAUEenbSi/Y6qyJTnfWPJ1F10AsclzX?=
 =?us-ascii?Q?dttP5D6J+tKkB9cCR4PF02JljIf0d9xC8SlvYkR5AjC5Cow2v2JiJ7F7xcm4?=
 =?us-ascii?Q?iZ3gP4iseOhIxkHZo8qRtz38hxtWhbWLaZ+cSU1f07I/UXL8RKYu8JpPvXcw?=
 =?us-ascii?Q?X9aqnFEQKsWKVTF0lDA9QYOBmMi9XNfToROI3eMaFCxCIlsaIotr4FVc5lnb?=
 =?us-ascii?Q?Z+vet5ejm259LUSZ9DOnkUdGMzRaIu+ILlRaSDLWsp9wgoQyup9H6eHv1oyi?=
 =?us-ascii?Q?dzdrgoQxZ4pjxu5IrsjqPDS+SmWgIbbRqk8G7GFVDv6l7/DvUFDj2N3pDXIf?=
 =?us-ascii?Q?Ik3hlgpN9cXYlUkJYUAVFK54HA4VnuMHUhuUW0q/nBaRGZRPS42uUAo9IN9k?=
 =?us-ascii?Q?U1nM/1PKTI3tGLFcUCA0luL14n/IOE6Mab8PSTkHWEIwCiyf5/pUjx3D2/SS?=
 =?us-ascii?Q?PmkUNmcyecwJYmnRDXkM4dw5hv4WnbYf9yNhDxskSWj1WMa7X6ImF8QGDOyV?=
 =?us-ascii?Q?rOIME9R2/3y4EoAmmvvjTTVFA9kqoijbmU24/5bLvjF8OIZjCY1lEV+LMvuv?=
 =?us-ascii?Q?v/Gauhw9EWYrE4YQHiSQBH5WoIMy86ODx5lfNkD5TXxAVqZTlyjO7nqRLb75?=
 =?us-ascii?Q?6PBbCR+WnNwdFQar6TnAdEqJ5Rw8CwXSug+pI8XNK/UsvtWEfpoYss11OeUV?=
 =?us-ascii?Q?rfwiTVI5AJgk7xXTLutaemTYNcMJmyJ52oNSxNUUtBe2rgxBUp3SzhHghYF9?=
 =?us-ascii?Q?gEVYllYZYrYyjXQzwGNnJga/ocWyN6m4A15Y+UsxbN3on9fqa/PVkRFvAXhD?=
 =?us-ascii?Q?URrxYypMlDb/OvKOFE3XU8PTFeoW7O9ud/5ExlIJbSiwXzAek+mPUt2f43MZ?=
 =?us-ascii?Q?Igs3r3+JDWumKAfFn9Z1mC3eVQlnULewrlb05/Wm6FpuZEIjV9VOpUiyyxEP?=
 =?us-ascii?Q?cgzysYjmRIBBigmT/KElREohcwX+NwmLKErUAKU+7K2NqEOP79Dj0pUGgg6O?=
 =?us-ascii?Q?epwwrrKmAFZI74BbFMAC6k30MKlLXZzkFgnr4m4DnwZpCz7YUIPuwqvCSJXK?=
 =?us-ascii?Q?pprOJYXC/R9FojDzXRhNWdPodcI1OLyVJfTyqj5MM0+cmac/JA3Q/Ml6iVGp?=
 =?us-ascii?Q?MG4lctL0tbG05uBtsQDkYx3Ea5eLlgAi2q970cfvJ8mpRt128xAABq/LxJqE?=
 =?us-ascii?Q?h6w40rHAx4HcjdsR3s2xOyEa6THRmdMnapGN1hwn9jrKndPuvldP9ytMmgvv?=
 =?us-ascii?Q?6QJzvrIRgeRVJVTpMEIedZE0ef4FuBqReR/qQpTGgTSWYCkEEys2lfL7KHJd?=
 =?us-ascii?Q?Z+zhbs1TrBvuOKjDjEoYgwRWCH8Q+izUfY9OmMsoS0BI+OhTsz+uNmjXiFhm?=
 =?us-ascii?Q?XQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f87d1e6-ec14-47f8-8f26-08dd5cf6f1ec
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 21:36:24.8656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lzr6KZ0jNBr3uMJHQUyKCglBqb6NGsR3SGClSjZIn1E0j75RYJVhJxVbOh/gvnDCWpVjQPWwtPLZY4BCtowrfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6006
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

This patch re-enables D3Cold by default on BMG.

If issues on runtime_pm resume are seen and the D3cold->D0 transition
is suspected to block the device or cause memory corruptions, D3cold
can be disabled for confirmation with either:

1. at runtime:
   echo 0 > /sys/bus/pci/devices/<addr>/vram_d3cold_threshold

2. at boot:
   pcie_port_pm=off

Upon confirmation of D3Cold related bug, please file a bug to the
link below.

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index a9f61a5fc971..12200be7b43d 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -287,7 +287,6 @@ ALLOW_ERROR_INJECTION(xe_pm_init_early, ERRNO); /* See xe_pci_probe() */
  */
 int xe_pm_init(struct xe_device *xe)
 {
-	u32 vram_threshold;
 	int err;
 
 	/* For now suspend/resume is only allowed with GuC */
@@ -301,11 +300,7 @@ int xe_pm_init(struct xe_device *xe)
 		if (err)
 			return err;
 
-		/* FIXME: D3Cold temporarily disabled by default on BMG */
-		vram_threshold = xe->info.platform == XE_BATTLEMAGE ? 0 :
-				DEFAULT_VRAM_THRESHOLD;
-
-		err = xe_pm_set_vram_threshold(xe, vram_threshold);
+		err = xe_pm_set_vram_threshold(xe, DEFAULT_VRAM_THRESHOLD);
 		if (err)
 			return err;
 	}
-- 
2.48.1

