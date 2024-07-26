Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568F2C3DA49
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 13:56:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF1F310E175;
	Fri, 26 Jul 2024 13:56:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gz+EjV1v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4715910E175
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 13:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722002172; x=1753538172;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SrVFB7HxLyepAGLZXvawnw9w8M4HdvugJwsJJD75prY=;
 b=gz+EjV1vtK7ulHJTZKsW0X4p22hMyy8/NIoLAlWKesQemXYw9rmHzKLj
 pC3QRlgimHwPFQiUPXCMfAnZqJJ+tGs1B4RPr6Bhu4TMzp05EV32w6zUR
 v7pWDhB8w1u7rPBhGK8kpLXsqKn0y0owd3fLswFkQNw0N+gONswvtpiOy
 cbETWqJfC+BvMVq3YsvfHqXSNzIppW7bksUQ6vhVUSUqNxZhxeiv80O7L
 duiWb3kxsDJ9hP1kEcx5U9ZbFcl3HLW72K78lpO7W3O9ePS/nZWk8aOlr
 LK6d13/MdQzlWQKaXxOqS3EjcVTt6BBv5XHSA+MxB/n4nVrImOAXLsLGQ g==;
X-CSE-ConnectionGUID: RmXdGyl6RcyNtLaTTn8vOA==
X-CSE-MsgGUID: SbzRvDrRRqCGk2JRYE5JGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="23594375"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="23594375"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 06:55:58 -0700
X-CSE-ConnectionGUID: N8mmvuRqTHK4UYNmZ9HHTA==
X-CSE-MsgGUID: fpLkjbmSS92A99m0aboHYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="58380245"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jul 2024 06:55:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 06:55:55 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 26 Jul 2024 06:55:55 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 26 Jul 2024 06:55:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mlcbQc4NGUCRBCRH2xyTcKpO14EhgS0M7d0UQv2iNkWE5FmnGdWrpvECaONP698QH0SFWjR02XKcIR1R05fDLkGg4MbAybfiBs28yegirFDkXU+JK3BKHgJ9aRCmn6iF74hEGARCMEAY5PApIo+mFVEFc/z1L3u870/Lnkk/+0p45On3cF+0j7stQzhuyfs9yfi+5UXQ99RWMr/VgStpCewKsYUb8gCNiAW2/9PDf8Skx2WWN/lh/miUizK0oVOpMBReleN14no71Z5ji+UN6seqk90s8qVjl1bIuE9uIGdowsATaBNS9QZKBMBmD0eeGGU1SeebJlkxLsRT4a5Oew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KIPkIIK4QEjZ+7VhhmosX4acV/hEFF0roNoBspAJLxM=;
 b=tmakEUkYB1WNKgoUsAsOMDQQaE6Fx7H/ydT1SZpqkL+NN44gqI5erXL0Oj7voeUuD0ZmjMzT0P/QYM8VY7xuQ6HBmuDa7rjm+vkpZrTCPbCxz0wkNIVnSuEzBDA2I5R0emwpv+0aPAoso/WR0mFzH9Al3me2bNDRYY8/mxJDM2mdy6aoliI3sPTPXUKX0SwTk9PVbPv88bQ7yE9zStWKTB9+Kk91AxwZUicYconGPhgJ4eoMc29qtSH1y07fRw3iFb7sFbPDGxQOWW3HQs0wmPBgdHvGHWQqSjCQpuHubksZxfpqcur76KuBLWlyXnRm3sk3Fwn6vcOFLKZFke3Cbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7394.namprd11.prod.outlook.com (2603:10b6:930:85::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Fri, 26 Jul
 2024 13:55:48 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7784.017; Fri, 26 Jul 2024
 13:55:48 +0000
Date: Fri, 26 Jul 2024 08:55:45 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe/guc: Bump LNL GuC recommended version to
 70.29.1
Message-ID: <ubx2e5eypvr5ykuzpvmd25owtmfpfahnt33n6aqeplxuebdb2c@sr5fymgc4bw4>
References: <20240726012610.706749-1-daniele.ceraolospurio@intel.com>
 <20240726012610.706749-3-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240726012610.706749-3-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: MW4PR03CA0268.namprd03.prod.outlook.com
 (2603:10b6:303:b4::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7394:EE_
X-MS-Office365-Filtering-Correlation-Id: 72962bdb-4bdc-4272-a8bc-08dcad7aa702
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6Dsk102HR1YqxQxCr6HkhgAmwViqnNKOIb63KsoBKA02fiZFqKX8z6Imbyw0?=
 =?us-ascii?Q?tIywqV/c6pKNjUATQySdZB75Hf/9m27iu5C5cKsCdXGj9ldolDvYPNWmIdA/?=
 =?us-ascii?Q?g8fMv2PuExKeN3FEtSsc/8CtMBhVfSUFJo4aSQfOoYfzmVEpbpe31d48QHC9?=
 =?us-ascii?Q?0wRPtg4Y6J2lOBQOXevjDzUDhJAmdMVa0EImqi/oggLY+FJYxtFYXf5KXQNo?=
 =?us-ascii?Q?G7YqtVpsfFSdaa9M5EF6Tvgws9qDz6XfTqL8W2zU9Vz6iHyYibKTI8BEo191?=
 =?us-ascii?Q?4QBN3YE5L2Q6m04gn5FoJOLb4vzazEcvjK/9jpJs/Wu7aKabMqrKh6rxbKuy?=
 =?us-ascii?Q?unUceMIS4AFGXn/KwkPMMVFrHaB8ywDI8dWE95Dhm0s2qMulAxzfn+qJKQ8K?=
 =?us-ascii?Q?R91UGan8K2QIyz9IEo23IuczDYh2XQRgxwCFq+zo16UoHCagBixDZh4cft+N?=
 =?us-ascii?Q?3tLBTV12l8C6Ms87RzO/DHQ77flfOrt0rUmP4yBlXrevcrkrn0y02Xk7A24B?=
 =?us-ascii?Q?wxv16gvNSwwh/wiLgHJC2wGDREqFVw2Wbks82hWTSgQr8sTKRy7HQyTmGZes?=
 =?us-ascii?Q?T23DCkHL+ZdTxsfvkSh+3vFW6AVBLF+6ucQ0xqWeKzhL7bDXaWnUshynSD3F?=
 =?us-ascii?Q?wpKU/0jmZjlkN+FAI8PNpBTp/R5HltKRtkXpyW64LMOUCmeFA937enSo0WVk?=
 =?us-ascii?Q?XNFqL+JcgSgEFe6W91YSEM52Ct1ARUCHd3LsyK3UKNjaUPpKeE7/2P040t5v?=
 =?us-ascii?Q?CHufjI1azqcPS9nV/EmGHMC8jgfeXUlnETiRF3ChH/wDcEuycJlP8DrdU5rx?=
 =?us-ascii?Q?GIq62kklJ0/pjX36rtDucx3kB9/wrpPS2tLAp8k2mX4upeunNzIv3+cDwsk/?=
 =?us-ascii?Q?rFPcBdqSZ3FN+orkFTTM85GmHlKXd/6QVGATNvB2deOtI/rkAoFPfLzGRo4f?=
 =?us-ascii?Q?7cq7sNQSbK7mN0C3tsEzkGoiKSeNXmMr6B+JErauXy3uBhlGczhc8ACtYULN?=
 =?us-ascii?Q?fMO1kfszrhVvm4BCFcWk12xBUnaahHe+bNJMNNZH2R/qjcjdT6MXaIdzTAmy?=
 =?us-ascii?Q?E6vE06Cj8t7IC9STvrhl6l+VEuFQma5Kk+tau4S9qjBSeo7uwOVGL5KGrKZE?=
 =?us-ascii?Q?K1iAXp5W1rTqNzXOSq1qh3lNEILWS84GIQWA5mGkVd1ecdO4/ZGE+wJt67uM?=
 =?us-ascii?Q?vo0pWPyfgUUT+qpckSMltnWqJOGlF1na7K7W9oyshXVBn0EkMhkiUiRZuzMR?=
 =?us-ascii?Q?4/uMfkyPRtbR12QuvZKyG7k8qlbSw3amU11TrdgQRTVMzybx8Je19OmT9sGm?=
 =?us-ascii?Q?NgfJHFgskmbbmYpMjCIdP7w47gil1XdB1tUIneAbbeAhOQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0+ysDzx24CjIQzdA9yoQMv270BNmFb58lzNcXvZz0vqIuVYyZ62F88Xqsm9W?=
 =?us-ascii?Q?9my+dMT26d5+Xck1j7ZIlKp+mqUQcl8O4BP+cDLQ/mykh5UX5hv7UUo6p5F5?=
 =?us-ascii?Q?WpdOYOV4RCB6nNCY95mRGJnz7abpOT7bQpDFnWLV1ArCQmQWvRZiNP8zZ++8?=
 =?us-ascii?Q?nNST5DtitlV8LAn7bsE/AeENjp8lGl5fHLxXM0AqpGCBOHMXtNMZoc7RWuf2?=
 =?us-ascii?Q?Nq+AjO7GnRjPbpQrhx6drgvS6WCbrihfELqLzul/v51IeXtLItySjZ2HqSnZ?=
 =?us-ascii?Q?UAqhEovZMNeb9ml6tJI9gKEYixK6pvvMnwUYmuiKbRp8D9iC6VaWUfHGPpG7?=
 =?us-ascii?Q?dWTUmnRvleldpGye+NzKsfG4H48UpEPCbkZPAwrOUYbHdgFYk/xOKu8CmI/n?=
 =?us-ascii?Q?4bdizv6cX3MyeMC/0ox2gp1XYnoXSM6JfVvix2V53Yel9kwDqAsDf1Bbnm5f?=
 =?us-ascii?Q?4G1f01CK8n3La7NpwWuKokXugW9gkS0WtVeRXMZ0Z1yic0lXJopY6mynSSKS?=
 =?us-ascii?Q?e/0JYtklwim9SlcpQ9rbfWXp4ZoZRs29z6OuaFqloBpd2GkKyhacgXhKrs7d?=
 =?us-ascii?Q?LHlf4A2TMw6vWSyEGDc1PP5xHVDyqM/eWHntY2qRAIMaGgSwAPjIV4i1AeH0?=
 =?us-ascii?Q?Vt4vcILQLVugxqYpy4uB1GVNu99sk+aoxuLHiBgv9IkcfniGtFGo5lsknBmH?=
 =?us-ascii?Q?YZHky99Ncs66P4ZVwlYV+I5Te47k/mumolpRrahF/BiXQMAMCCERPuLp5vvr?=
 =?us-ascii?Q?sQiq+ARJV8AfDBreJs5suS5PtRivCb7UF/O4geuzFxktYyQJHhPj9p6flTQV?=
 =?us-ascii?Q?DgJ6zNIBw933amDJh2pn7npUhXC8RJdhLIOh9CxQqm3jYhZDZ0X4JWrKpdfJ?=
 =?us-ascii?Q?MFWzCT4FRrSxpX5QZ4Ok74tuzZClhCmYU+77sujk6+7qAPAJeSvdmT78K51c?=
 =?us-ascii?Q?ntCIz7MPzniKpe93i9WA1xSoUaZeVIuqkyH+jjcsjNP+xn6ZryicAjdNs3X/?=
 =?us-ascii?Q?oIMN4YzvMShH2JPcAxCt7Cs+WyT6N1JWQDPH4tQ3HXHg6Mmsgtkq+qpVwGwm?=
 =?us-ascii?Q?6Mujy7/NTwnChKqNXgQUNU3EXm2oA1x5V8b542XNllPzAwf17p2vOdcbHwCl?=
 =?us-ascii?Q?UxlxGtJyfSXZh8U2pl2DkpU2urGUcL5akl/0sN3Cc75wVgCx1BmkTm9fzLQy?=
 =?us-ascii?Q?tKxDY7DZIORNFX7OU1CXxJr8dC4bAsfPAsGD6DEszC42EgejH5OOh7p5yKiN?=
 =?us-ascii?Q?dMWhnj1EnafvdW8oy5jskzCTZDYcxrm16Cu0U+NbkDodKpIkNRbhxs96qB5e?=
 =?us-ascii?Q?YoTXBBLs0nDAw4PKtEM0l8uwwLO06IpYLJDKgPXHB8+F/L0ryv8BD1aK8kKP?=
 =?us-ascii?Q?W1AhOeUqPE56JnFHZ7kzKYzevjN/pWQlvboY5mKQqYEGOw2UK8/aPNNkydpb?=
 =?us-ascii?Q?yMOx23sqx4Zdensg3aOJ3RqgwIfnrq6+667fm3RUvZkqvls6Zlxa76yQHz6s?=
 =?us-ascii?Q?NnAO97bg2w6qKqYYmUswbDeJkgYhNVANpVAmeH2//6sXj2djn4LBQc9LySon?=
 =?us-ascii?Q?Z52E/kW3NatyXU3VpevvV2uMDNMaA91y85vIKOAropXH3CTTZrqtxw43h8Hb?=
 =?us-ascii?Q?4Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 72962bdb-4bdc-4272-a8bc-08dcad7aa702
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 13:55:48.0729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZRAZMlHmT93NEpqCPNY4xGphKgWb1GwZ2+MHhLwz1VPOOxThH8T9znUag/oCKapk4X45tqyIBHZLyiwkxouDfVl2s6tCPReYhoPf2ScQC/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7394
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

On Thu, Jul 25, 2024 at 06:26:09PM GMT, Daniele Ceraolo Spurio wrote:
>This is the release that includes all the fixes and WAs required on LNL.
>
>Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>index c0ff44e0b0ea..cc84484d3372 100644
>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>@@ -105,7 +105,7 @@ struct fw_blobs_by_type {
> };
>
> #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
>-	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 19, 2))	\
>+	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 1))	\
> 	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 19, 2))	\
> 	fw_def(PVC,		mmp_ver(intel-ci/xe, guc, pvc,	70, 24, 0))	\
> 	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 19, 2))	\
>-- 
>2.43.0
>
