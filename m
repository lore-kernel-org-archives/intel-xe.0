Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F27BCD128A
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 01:59:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45796113097;
	Wed, 10 Apr 2024 01:59:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DPun+9E+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B71E811309B
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 01:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712714343; x=1744250343;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Q3JsmBma16dKX957Ok2qmdvt2XRHpcE2mXqE42VcdGs=;
 b=DPun+9E+SAI6yjQAUT1oMOtQu02+Pbc7UB80gCxLT0kS03zXMSZwqi2p
 uXsUeNsp/ayymHVGPEtMn2MWcYxAergepi7XHkHeptSAQY4ddnOObLsAM
 QnLczqP5deED7Fs88Jx0zb9A9UlJg/Cea3QFsvgLy4jHXuy0Od5WktvZ/
 p8igx0U2VKpJfT9jO7QfWaV8bajGBn9oBoGnsmP98RjovjFu0Cr8LIpXM
 FCUFg/Sril624TJ6VGn0uWGO9iBZRYTd51nGuqp2Q9w+tVA3h7fnmpzRH
 21R7Pgg3kh0yS6NfBSRORQ48/Fp6UJj6X2RjpvaCghNyPACDDqmx3e2EC w==;
X-CSE-ConnectionGUID: MLrkrdYvRg2Na4Zq+wW1vg==
X-CSE-MsgGUID: Julajh57Q6yDrIkYKr+usQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7914109"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="7914109"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 18:59:02 -0700
X-CSE-ConnectionGUID: f/SGY1mJSX+GruOWOWCwjw==
X-CSE-MsgGUID: MtANNcgeSiOiuVWhTQcFIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20971006"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Apr 2024 18:59:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 18:59:01 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Apr 2024 18:59:01 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Apr 2024 18:59:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fDDGW+PRkjwqaho+u5p4fZNg5plQnqHnGOmb1K+tyHJSY+ftCAEDYajV6HehPD6F5mfTMh6QMCcnsu9d2Zyx3Qd2+DcJ9XfIqrzWNbbEkhr2VO02PmWSjOc7Hds1GMhxSyUQCkmN2TkrRlL7QQ/hAw0JsbldKIJWF/MNlyTZbIgHW0yYT9q1GWpMHK7oSV4IeuLRlWv184ksrAaObXcwc3NWJr3sk3gys1eaZ0ZXS88Pjg3vubGAZ0IOfSulwV4nlqFRK5kJGxfsQHc2zNR+A+tD2Gl9Ky3caAPqFogod5q6OYcRn58vd5sCBmQYn9ag/N8SKDjQmYrpRJRk96Rk3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=isk1erFMTbrL9SpmUpYwefX4qqkdcp9G7GuZBlWgF6E=;
 b=MJXODDoG9SFkVz9+w46Px6AjdB5BTp1UGab4kb/E+1lxVtKLyHcfMJvO5V89THajE8blLgokBIhpytWQzLz3rXevcyu6KXq+ApVi/Y2PKLi388suDDWpZ6MoXC07nYplSuoAM8E7BdwhiIJ3I1uml7SjlM6ZIkmz7fARp0D2EjD+NrTiEcwpZqpb3tbC3VRRk9GsC3jDhKCQuiF87zDdGhGCMG19n71nCkdjy+4moqcAVBuJo5S9N9RwaFLef0dxB418WyAAX83Dz6ZF8VRn9K04bwWH1CPKyilUUX3Pyx1IOvzlcIRryHZghFgHDRY0qHdwxAlKdyzO8oBwKxE2sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB6891.namprd11.prod.outlook.com (2603:10b6:930:5c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Wed, 10 Apr
 2024 01:58:59 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 01:58:59 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: [PATCH 7/9] drm/xe: Removing extra mem_access protection from runtime
 pm
Date: Tue, 9 Apr 2024 21:58:23 -0400
Message-ID: <20240410015826.1093368-7-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240410015826.1093368-1-rodrigo.vivi@intel.com>
References: <20240410015826.1093368-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0071.namprd05.prod.outlook.com
 (2603:10b6:a03:332::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB6891:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z1RaPAN+DStLdlGp5i8NwqS1P5bPG7NlUhS5ySB7shfcEuW/G2ku23Ln5JTOMnEFMeHAXtfCv8M/qi4eiDePT8JZ0ZmLASRYNgpf2w0uyVSwAgnhdt+QevtgxPNbeW0fr0WcmWdPyqCL7FPSKZuM5LIUhlk7g6Jz6ctaTYs9XiY77aohX8gd1CR9cxKow2fp4wwHa93RH5CYoCDYki4CRIFTh10zYUpafMws7CCccXatG9KqzTErtak00WMPqEpT9isPEO78phkWgeqUsxEhDbzE10rxh/hEaW0BH6EVcBzXS2BqPWSG575o671Djv996E667kKh/eShclgy4IOoOUV3GrpxQpTv4xmnGfujbLmCTDRcDBlQQ6clTkKGe066mHxEYkRMqfC4j7kESKk8603V7SEFPnWSBThVXB47cnzKzR8hbTiYAhX5aZIkZhr5KyEmBg3QlanKWTaUZNdFcap65eeGsJ0AhISHsO97XO0X1l6l06qVSUeBm5R6EhiFgitwjPH5Yr4XKgCMnSwjVnyu3fEOtUkJvL3rCnGEkf5utN9YyyC4tJ49wtQjha2tQHQfMCQGDvIjV/CNIPIBApuBCglvlanBUSts2fFXESh5nvQq47abfkwxjKmrHJgfuLTh37tth/qT/LvNf5Eg9Oa2iGpF6Ca+FVn+/TWoUVM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wEUDGi8/iInqI0Nzv5glsgvcsUwI05hSnw24BXbPf7Bp4a68vFhcExIbR2US?=
 =?us-ascii?Q?RvFzgSK1CxgHPT7xTW2E8ILZPyvwqwp+P1hM3b59RYP+JwyHqY/PB8dGs/b6?=
 =?us-ascii?Q?5fjrG+6wRGf39X1X0KYS9MoSDG+DzDcoDGMC+6MZtU+7RUlLIpP1CZ8stBJw?=
 =?us-ascii?Q?BzGBdrVkE56oFMqqlDBaOvNZwqiBZ1NvLI4wFXYbaWMRYV/BAo6jfR8ROGJj?=
 =?us-ascii?Q?WGkYYiWeHqrl00ezE0SykEvdnn/i5bmLjb6TQemMC2sGSllEnwqmxnvFAvJE?=
 =?us-ascii?Q?+k17Sp5EZhBySr2dCDfKNpizOtWa23rgX9OVGLocU+dkUlNY7AyQC5TwYVol?=
 =?us-ascii?Q?SWfIotc3BHP5p08rTZ3THwZhnlyrO/Cp704pdjZ4GOu4aGX3SHlVJe3r1nxV?=
 =?us-ascii?Q?dVmpe8xiNjWXvphUnevYV+S68RdcANfo415N5PSlCx6D5iIzUVOalRCKNzMz?=
 =?us-ascii?Q?xA64LVpHaaIpMonWUG0v0tabrKBaZncxHh46VxwYmrsAfS0bjARICw9Qgug3?=
 =?us-ascii?Q?PQ3bXhB4/M+tKsjbMrVmHMaX2tzCNGeAk2CtPVZjsjgn/KHu3xRNWpUTHlsO?=
 =?us-ascii?Q?dp9S/ftBBqQFterBResvat2gKRkekeogR87CpmzcXEMHjkU4gbvlooqV/M2b?=
 =?us-ascii?Q?ENgvL3RGNI7LruM2BKodVslQQoLXsbUp6yBKsWrMK+IRInqqYobZj8SXUZnH?=
 =?us-ascii?Q?7xzi+1ZDUh2FsWUMK+ny1xMYVTsEeZflHnFju+W6C7oKpu7b38/Mfv2HlRhq?=
 =?us-ascii?Q?NSls559KyQO8+iDJgxIBkDjablUfCS17wVlD+gFWh5sO5Ll4elzqOBdgNwoH?=
 =?us-ascii?Q?/6Y4qxmjh6cgCaVoLkh/Bffr2yjRPWvjHbcWIuuG+/N3kSpo66FOA4b65tgv?=
 =?us-ascii?Q?fo4KojQ8jaMRygHdwtoFLtGFjL1VTfJp2nGgXPXtDgOnRSLPt5EwdyjjhY4w?=
 =?us-ascii?Q?cTqekVgtrt82sQhqShfxm2Ry7hPuPf+N/qR3vt9JUHJZbJpZTjZ78xt/Jswj?=
 =?us-ascii?Q?9c4FeXAI8ypw18cNtpsJJ5cZ6KR7jlyxqpiWqDlWRdBONQo8j8kriTD7QSL3?=
 =?us-ascii?Q?s1Br1Wq2DMVKP0R92jIIWj/5MT58RkrJSg56s4crAot+M3sUjZF/03MGVwej?=
 =?us-ascii?Q?ZkDkYvaF7eoOuVOaL71tazl9aN9e9lnAkaBqOl4aiRo4NRNfMIkwh8pGbhgj?=
 =?us-ascii?Q?3Wf2DsGvo94zIaq4M+LBRTeP71uVpy+QHfcOnI5R7gUBj2AyUjTKdd6dtPli?=
 =?us-ascii?Q?EIZyDGPeuq+BJC0Wg9VEgZJn9aRfMjDA2k9I56qWwdTB1H3Lb+LZS7MDe1bD?=
 =?us-ascii?Q?XQtK45znHdtlQL+4ItkqZ8kHEBI+e6ZM8CeZ93ZGOnQwkVqhBj09D9r20wAH?=
 =?us-ascii?Q?QZjDxOP+thl2ZjCp2sxT6KfBBuRVsVeZXsZgF0DG/7oYX8Gnz/dvwYX4NkQ7?=
 =?us-ascii?Q?bDYJIFzcC/pKXiGikramKrN6iKmznZ8hQq+jvJizjRibrElfhvaZdahoqB7n?=
 =?us-ascii?Q?IPtzoEFNPIfFLXShe8/aGNvaxhZmQvsYB5B8fDF6AiL4PKT19qu6m51N7gOW?=
 =?us-ascii?Q?/B/T7Z/m6PGwH4sVx4s3DSlkIVVdkwNLthOxodar8vie+puPz6V2F5dHrLU9?=
 =?us-ascii?Q?WQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fba292f8-78c6-4e81-27f8-08dc5901c976
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 01:58:59.1993 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zLAhQoPBku+kgzkUNPchx8iz8KwvOrxSpZx4hAZFQD5MXKvRthDHwJJRuiS2QetbLfk0g1+rAhbg6gJxmYOh1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6891
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

This is not needed any longer, now that we have all the protection
in place with the runtime pm itself.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 8 --------
 drivers/gpu/drm/xe/xe_device.h | 1 -
 drivers/gpu/drm/xe/xe_pm.c     | 3 ---
 3 files changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 7a3dfee5473e..1f2fe1466917 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -650,14 +650,6 @@ u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
 		DIV_ROUND_UP_ULL(size, NUM_BYTES_PER_CCS_BYTE(xe)) : 0;
 }
 
-bool xe_device_mem_access_ongoing(struct xe_device *xe)
-{
-	if (xe_pm_read_callback_task(xe) != NULL)
-		return true;
-
-	return atomic_read(&xe->mem_access.ref);
-}
-
 /**
  * xe_device_assert_mem_access - Inspect the current runtime_pm state.
  * @xe: xe device instance
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 02eda6610972..39921666e1f1 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -138,7 +138,6 @@ bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe);
 void xe_device_mem_access_put(struct xe_device *xe);
 
 void xe_device_assert_mem_access(struct xe_device *xe);
-bool xe_device_mem_access_ongoing(struct xe_device *xe);
 
 static inline bool xe_device_in_fault_mode(struct xe_device *xe)
 {
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 9d80a2d8c402..739d34db6236 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -308,9 +308,6 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	u8 id;
 	int err = 0;
 
-	if (xe->d3cold.allowed && xe_device_mem_access_ongoing(xe))
-		return -EBUSY;
-
 	/* Disable access_ongoing asserts and prevent recursive pm calls */
 	xe_pm_write_callback_task(xe, current);
 
-- 
2.44.0

