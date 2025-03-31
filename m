Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FAACC3600C
	for <intel-xe@archiver.kernel.org>; Mon, 31 Mar 2025 15:27:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF67710E3FE;
	Mon, 31 Mar 2025 15:27:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D7dcpdwW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F353910E3FE
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Mar 2025 15:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743434854; x=1774970854;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=w1BhffnmDRWkYdRyPd2BXn0a/AYoYD15nvhx2cSHiPY=;
 b=D7dcpdwWEARl5l1PUe/weoodd1H6YyeTIp5zfbbFnKGG/p75NhKtsNY1
 zk1soITzVo95elNIttV/PBUf8MT4gmLq5+cgnYpPJmnirYlzonW5oQj2b
 uiTxYnNwSoUc1PN5ILikyqASXkw1J2tRkQ6GlhhU0BeOS14O0fqT9zIqS
 ajIwui4ly8JGHUwjoaEnpk6G23Ze/uyGPyTQzzzMaGPuJmLXCf7s4OqxZ
 TX22hLG3KFvQZYQGcCaEiv243af/oS4PtOWSxh7llEMbDA6eS6bUM0gw9
 6jckBnn6O+Y0NAOQMvrlYwzwqesFaml7RqrLldmtdFGmpq6V79dUQxkAH g==;
X-CSE-ConnectionGUID: jtxNd8b9SxGxMapF20gPyw==
X-CSE-MsgGUID: /XGePz8PROapF3zroRdQpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="44902794"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="44902794"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 08:27:33 -0700
X-CSE-ConnectionGUID: ygiENbwDRs65KRjpl5et9g==
X-CSE-MsgGUID: dDZZgDmUQjOI67ljA/o13A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="157120438"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Mar 2025 08:27:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 31 Mar 2025 08:27:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 08:27:33 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 08:27:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=frBT0ja0Ni3NJFhXoILwdTWUf4aysWjE2YjGc+NTepQsfD6hXUithdL/WOfc1HEcONDc/vEnn89A6yxw3ZTQsSC3Ic3Zsi9dN0MZZZRcEp73+nhXqp2UEL1JHONYQHlZEGYfFzMO+wiA+fNFHKzsUYKSVMp7ycTk9SpNzzP0DjOrtOgQj7ydfHjaFAq1gdlviEamTf3tVFsJhGtPEfQMs4OYi4It00Aa1c3RumAzuxjmqm5Ar2SJT/TniCQ0Bb2eEttYxAK9L9XNrNVzbDi4AiwIln487+FO+J7Z7m35v8+Us2SxscH887USyvinTWtlHbvS6LoKTOGpzD9TlFebtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CXVryBXNkQgvLqBW54lwVTSvpbSuk1N2CnmgkUp6zNo=;
 b=Hh1IQHzxWV4UaXOLvBr+RZ/SFgvi74ugx7rxRX6SEUGB9SWVKX+1lOY2o3rw5ElTo5AiAa94nwouiqDbrdjKHYXpW+EzUzWNEyF838mR/tFFoWWl0Jzyh2FL0GLoE7iheT445CzEm0FgWkwPVieV6yllLGQUJbrXom7IP+P5P1AbWAHCI7a7ZBulm75lHv23m0amlDjByFvV1TJDr9Z3CyyzCrtlJIHVsg31T/tNXeSZarIjYfxDVa49PcZAvEpLjQpvrl0qq/4l8zVhrS1lTPV9kN1/CW1OJ8dACupGbfPEgmrDU5yC5S+GMyDFIp5N3qhDFecSkZq35vGU8yoDbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ0PR11MB6694.namprd11.prod.outlook.com (2603:10b6:a03:44d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 15:26:56 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 15:26:56 +0000
Date: Mon, 31 Mar 2025 11:26:52 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH] drm/xe: Restore EIO errno return when GuC PC start fails
Message-ID: <Z-q0PB0sBI64GwGX@intel.com>
References: <20250328181752.26677-1-rodrigo.vivi@intel.com>
 <uqd24yuordxfvtpdwnyhod6g2khshwg7kpzha4oqnnuzmkko2k@v255sredurwi>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <uqd24yuordxfvtpdwnyhod6g2khshwg7kpzha4oqnnuzmkko2k@v255sredurwi>
X-ClientProxiedBy: MW4P222CA0012.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::17) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ0PR11MB6694:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ebf4bf8-8fff-47eb-cbd8-08dd7068789e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bKUuoNZfb/678FajZ0yDLScYkSlp+eF8PavwbwHK1Y/6qBcreV9GK1GeDudX?=
 =?us-ascii?Q?PxpJMXtD/fSxlfCCivVTte4xR2+YpUwH2eqOh0fMvptY0csDWq23eg5BSISa?=
 =?us-ascii?Q?Xfz2LFhG9nS7Ke5aq0PgXSy/02adJzlAgK/5jt/15gtK4W/VZYkf8BCavv7j?=
 =?us-ascii?Q?xZd4vIS6ZoWi445/RsGl9XsH3uZFn/LtDZ126d66QtlzcDQ9E42JYA8q604i?=
 =?us-ascii?Q?lf+PNWSMMku4pK7ViPpcGg+2/wxdaAJ7ovEJ6+HlC2FbuMIbp4kllkJ2BEk5?=
 =?us-ascii?Q?RHO5/Qt2zva3rKXxooT2FNa22+wsnTCorYF2mJgYu1/f6jj0JTj2gl4Y+8TP?=
 =?us-ascii?Q?KI0Onoy2e2H3MhB3wMKBFqY+AOlkA3V+y+fS3ed35TRoHSXE0Q+2WgBQ7cm6?=
 =?us-ascii?Q?8971uXTIxqPF+7eyABrTOICN6HZ+ABeOJrKh5Kq4XKzdQUVpp5WoKhQ1mdxe?=
 =?us-ascii?Q?cnl4UbjFj+5OQJkfxG+gNTvfqx+isX90RHPeUjY/TiQolRX4gxBNNORPXlsz?=
 =?us-ascii?Q?NU9UmYgni9CAQ9icfDo9ZtdHv17WBseq0e2omjWpR8OW8SYvgJp6gztHPS4l?=
 =?us-ascii?Q?KYpbn9vmunDxQHk6rapFVmkG2Vwv6Cv1FkoDNOk+lO2FRl8DmovFB2fmH2Vl?=
 =?us-ascii?Q?QRRKoyqtIUekklQ7EqoQfjxrPtoquh2kALbkg2aojBprE5jSj1bpkFis/lZg?=
 =?us-ascii?Q?5PSfPaaxMCoiQ5d+ts+No3HIrs3LFfZvSXc2v2h+uI48u2bKmDXcnCqP5rj4?=
 =?us-ascii?Q?7tv37dImIfD8pWMKaWxU4TH0xwcqPANHgLPctKS2qXWAxF/J1wWwPYQjAXTy?=
 =?us-ascii?Q?quQfAYTf4tnw2iPdDBL90YbRlRPnkstyM5dP/ATH/pB1zcqVLbvEC2iV3azq?=
 =?us-ascii?Q?hJWBJGplVx2jXkY2zC+J5HB3MMxh00q1kX3MNASiNcqOIBCsY5HiCYaCGfox?=
 =?us-ascii?Q?KECvDPmBJFcMf5aX4RnJC/M6r4MzXoJe3xX9TG1LiVbSwc9tq4c8Y5YQReOk?=
 =?us-ascii?Q?ofAbtSbv6bwy9y+rOK6wKvh8gLi/Sa6tlIJZ15d67mBxy9TLvIQvAIal2LAq?=
 =?us-ascii?Q?/5ZErs34VbDXmW/Tge871nOCYTNFE5nU8NPr6+CKVDnrI51hgXF9lpAhUf7u?=
 =?us-ascii?Q?f1dURa064czY/iEnnqjnmDkGC70kSgMsUR3r1CgHKHY8rZIKBt6ENpVLB7Q2?=
 =?us-ascii?Q?fJtxjyrYczSrA3T59eQAZA3GJRS++bD5/eJP6VfDZUKd1YG5ApJEwmIjVMuC?=
 =?us-ascii?Q?8bVudITTMcTtLNvSmGMHq5qp2HLxZIjMDTdgH1qv/NkILuKukaaEPkOlKrx9?=
 =?us-ascii?Q?FLqDo5JgxIj8KLkeKH6pWI5nnH6w7tzJHcVEqINRV1Vnii0BmHvYi3vKwxlq?=
 =?us-ascii?Q?BJK/VWecP2IDimhd7Vm/aZ+MJ3vd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xgAQp5EJD0MH4yS5d+scvb8dn9Plm8JOMiemNjVgFTzto2bGv4e+30dyG3AR?=
 =?us-ascii?Q?iAVHrM1cOkLm8SvUzA1YuQ61ZQwT2qelDuwvHIL/Ou5bIzc0JLEhjIVOlSwI?=
 =?us-ascii?Q?kvhaUfR4doH0nu2u9yR1JTp5Pu8Piag+zw9ZXUn+UBsM5KVSOis/Cvv2gzWN?=
 =?us-ascii?Q?sY00TsFhGReI/eJi5leulprCoDj0zo3WRWregeZEYUTeBf916y+ZGgmUEuJB?=
 =?us-ascii?Q?z1WwN1nS083PNefGvNnVY8mXKIYpIFjhS/a0JfO1DhZ9jV+GFlsPSS8PfZAl?=
 =?us-ascii?Q?YP8a2QMuXJ0+LHK9C+44CsMvV3rIBvbbhBrWb5+IxlUpwfzXBlzNQCZEZ03i?=
 =?us-ascii?Q?xqYec2cXTRnULRzp1E+l3/328WpcO6EwZnHk3+vpZgGeR+Pbvuhb7vbAd6wh?=
 =?us-ascii?Q?zLNZs6Lgp1s6y1wZDlJF+TL34zHKRAXTBIiJTlqVvZGns/EdD4NTu/IIwklO?=
 =?us-ascii?Q?3S2QKW9rGhtIjkQT3jFQRlQWtgPhjcMkak4kmgqKljB2Buq6xtKnZgvXE5HE?=
 =?us-ascii?Q?c+jzfEiVkvcFpj0OkBooe5EffbD1P9VnbObsr0o6dDxS4ijS9CFOHvQdjzs7?=
 =?us-ascii?Q?di8XFzxCJKEfjlf7FAMQ0A4ZicX3mkbsGVnaiXQZkmtQ1j1hQ/r37HI/qEoj?=
 =?us-ascii?Q?46ZqfaMdMiAjB0NDIhxa8inR2dvXR0XfhIO5Mghs3B4F0CbJnBj7OeavhIOA?=
 =?us-ascii?Q?onYesT54zCQEBMSS2KMb2kgLoORpaOko5zzwyW53heXp5ddHTPHKI/z+N0KK?=
 =?us-ascii?Q?4+T+rDkjuQjkKR2ZkQ4PxIRl34dWdEmvySxuzMCG+IEPBlUzs+MYCnVYpqSa?=
 =?us-ascii?Q?v+BH32Jl5NjbAngBnXOabGdntxkQgGnBjoHDMRqlXTaA4PWdzT/f3wP97DNw?=
 =?us-ascii?Q?n67euOEnx9mEKAhqi5Epa1JKeDiLv2YbgdNK7s6wZ7288Es/iCc5AGSE2ruv?=
 =?us-ascii?Q?FQcF9zGheMyAWg7xEwXpKOhkDU1Itp3p5Lewxr89kMl8WDax9h2f/cvwzTdn?=
 =?us-ascii?Q?3MMhdg2LZbrip9yEh5NKC7VN2KigKdB4Otke7uYG6OTmAUTp2nQcDdXQOVmS?=
 =?us-ascii?Q?qdXHjHHL95egl8inMMQZ4DGIC2XJpEnjjL7Mx/vkLDhe5IwMLRsEqJ9iLexE?=
 =?us-ascii?Q?N1LwEcAIrCVFL49rGtMPsT8AtkwefuDJDfBqLM/yJfjLWCGBxxUj040bO/dE?=
 =?us-ascii?Q?lNux8oXW9fiuVKabiKyr9FFBW/+PpUlDwkyHg7bI5lE/oxx/rKFI4pvTNs4j?=
 =?us-ascii?Q?Yn/wW6/vAfa5X79pWDTjKFXM31WwspHmQzRwh1lGj9eWqmqcqsxBLU7mSpA7?=
 =?us-ascii?Q?OfxJDEh89VW+QoGEGiYLOTUKUN3RFTdB8K8dsYn9EijO18Ly4jmdlr0d76Xw?=
 =?us-ascii?Q?OuBnUrKIs46ZE6abyySXmofRV0CfXEY1bsztrCCr7MD/pBvSdQ0RBCaN/R1J?=
 =?us-ascii?Q?qBgP/2ySuxCPaJyrQclBH5zmdkxbC0h5TpfehMgSQmPOpWDRzuphmDa0KO4Z?=
 =?us-ascii?Q?F7167ObWwapqMbp3j3QcoUSnS/LsbE9dVN70a/BO9hQvIac/vsGYMRhKfdDo?=
 =?us-ascii?Q?f31wG0aRRMeacZ1aLkcdEFHbXt5yL8rmP8eeK9/wi7TdsVjog8eqvSsTyaVp?=
 =?us-ascii?Q?yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ebf4bf8-8fff-47eb-cbd8-08dd7068789e
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 15:26:56.1400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jk8QRZ/WNrFOF1Jr///scAM38f9syawj7eyf0INcOFodC6DjdNRhEGM2tgd+Sl3v0yJ4BwtifT7oMzLD2Wk0zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6694
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

On Mon, Mar 31, 2025 at 09:59:47AM -0500, Lucas De Marchi wrote:
> On Fri, Mar 28, 2025 at 02:17:52PM -0400, Rodrigo Vivi wrote:
> > Commit b4b05e53b550 ("drm/xe/guc_pc: Retry and wait longer for GuC PC
> > start") from Mar 7, 2025 (linux-next), leads to the following Smatch
> 
> 	^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> these are not needed as the commit referenced is simply in our
> drm-xe-next branch (and if it wasn't, then this fix would probably not
> go through drm-xe).

doh! copy and paste without paying attention.

Removed this date/branch part while pushing, thank you!

> 
> > static checker warning:
> > 
> >        drivers/gpu/drm/xe/xe_guc_pc.c:1073 xe_guc_pc_start()
> >        warn: missing error code here? '_dev_err()' failed. 'ret' = '0'
> > 
> > Fixes: b4b05e53b550 ("drm/xe/guc_pc: Retry and wait longer for GuC PC start")
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Closes: https://lore.kernel.org/intel-xe/1454a5f1-ee18-4df1-a6b2-a4a3dddcd1cb@stanley.mountain/
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> Lucas De Marchi
> 
> > ---
> > drivers/gpu/drm/xe/xe_guc_pc.c | 1 +
> > 1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> > index 85215313976c..43b1192ba61c 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> > @@ -1070,6 +1070,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
> > 		if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
> > 				      SLPC_RESET_EXTENDED_TIMEOUT_MS)) {
> > 			xe_gt_err(gt, "GuC PC Start failed: Dynamic GT frequency control and GT sleep states are now disabled.\n");
> > +			ret = -EIO;
> > 			goto out;
> > 		}
> > 
> > -- 
> > 2.49.0
> > 
