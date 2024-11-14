Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7346ED68B18
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 14:07:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DF0110E2AE;
	Thu, 14 Nov 2024 14:07:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NIAaKl+i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9647B10E2AE
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 14:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731593259; x=1763129259;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FGgFcFKfsZFMEUWhBHR5LIPnGo+pNLDLd4T7I0HEv+Q=;
 b=NIAaKl+iMjCqTz0Znn3rJx1uvrmVaMAEhcTZnuNV/pdfhk8dG2DH5dum
 VJkQPKDwGXgZdfYAFwYGkldvAc+GyTNiVU70sQnzM56Ar2uk585FGThzS
 EPVomyuFdrEAhp5DxOFFw9q7AOKhKxusnEO6cT0fztQ6Bf1R+cxjlz424
 vdXSd0yM/6mvL7vBKmIjjFkxWHdO44dn+w1VOFrwnpd6Dh6XwWkScxxYT
 rEVuicgDKPsLvJ8ro0uyN7M5N5RIKH577QGMaQA4ny3R5kfhRVoDTkmCc
 seDlLcTYcr9X+VjD0qJw8/A2sBmK1w7pM2aHH1jT14uw3xkTtS3j/v6W+ A==;
X-CSE-ConnectionGUID: iSbD1qJ5Ruat9lVrPzvysA==
X-CSE-MsgGUID: deXjTDl8QJOSyyCbxaIlrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="48989500"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="48989500"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 06:07:39 -0800
X-CSE-ConnectionGUID: fckVDMkfSCSA0GKIOoam7g==
X-CSE-MsgGUID: km/Z9WMsQROhdr1sUhseLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="93165388"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 06:07:39 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 06:07:38 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 06:07:38 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 06:07:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cviT6VknLl4BsUfg798FzaiLzbIBNW0e/xMgZgyRecXN2EYBS+kSwvFt/Ae0ciYicW8V2eSbCin1AC73LKITeFb78M6q5sf4BxxOW13bm2JDWqNuQTPOOgdPO5jEc9JDmSXeNWClv3cXm7uDixP6B92apE2Ug4/hClyCEOuayxDb4cK1pQHEJNFAzwoVr6pwCZ2KA1c5ptJD6Elptg1qY8iLMPdYN+UcFWbnoGhleD9JaDy5ULXHUZrb8AdiHNT+bMpKYN1EoUaJWE7b1guRoIG8qNERuZtXwvluPsxBBMmMwPISYpseb4lqeqZC8KydazKl7+ie+Aaub20ADbLlrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uk4G3eCzSIJphbTFsAsxZ1B9pP/5MHCxC6KUrdJURJM=;
 b=LTUJ8R7FDGxq5cKkBTAC/w4JRr19XNhoMmPvL1buKHC1tFV1330elr3DDVArU8Ep8IPFl9GnMjfyG4UqFNMhrzWemaGp+hIAt1sJpP/XuXLiUu5icv7DgyHNrdqGD27pAprqpKBKt2S6M4ZNtOinxw2sFRYHOoG3lKpnerp4+u2toGKiOMQ00+Cy6BVgvM/46Ei8ucjHMcy+g24xmMXBA65P+0jjCiaPf732aTek0QLtAcqaRzWednm+7HcTn9K6cov6wcD8knWu4dQkUPQ7jWcZ/9DOXCUOxoKFf66mn6lOytQL5vC01YRFUezdmd5SiJDA2RxE7+CZdAtaiuAZ/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 14:07:32 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.8158.013; Thu, 14 Nov 2024
 14:07:29 +0000
Date: Thu, 14 Nov 2024 06:08:02 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Niranjana Vishwanathapura
 <niranjana.vishwanathapura@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Ensure GT reset is complete during ccs_mode
 change
Message-ID: <ZzYEQgvuTRDSJgXR@lstrano-desk.jf.intel.com>
References: <20241114133738.2125717-1-balasubramani.vivekanandan@intel.com>
 <20241114133738.2125717-3-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241114133738.2125717-3-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: MW4PR02CA0030.namprd02.prod.outlook.com
 (2603:10b6:303:16d::18) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA1PR11MB6098:EE_
X-MS-Office365-Filtering-Correlation-Id: bad08249-a432-4b80-85ce-08dd04b5ace5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GTLj5rogwuk4FGZwrVzYRNWnR9Hsa/jftDyFEsAv2WzUQdK5YoiiC79ehX5E?=
 =?us-ascii?Q?mlO3waKXAEzdkuHE2OuBcTMxwxCKOfXd+7VcMn0u4KAIBu9CYGCuKjkDhIIN?=
 =?us-ascii?Q?l77S4f1BoGjFgu8CWFR0FVEBwthCISUOKyG6A1o7FP8FNg4Ytb9v1nPVdAr7?=
 =?us-ascii?Q?F+NeRWh6jecmfV4jspbmhCJoIigqmTjyGX5N1/A0f8e7FEnZsuF0QOhkhhWZ?=
 =?us-ascii?Q?aAxRL4C1twrWMcjpKQ/lvn1PNFS+XjbU4lpTNcr3mxbQ6EmR9QZHyZsb7rNs?=
 =?us-ascii?Q?NNf0sFj9xPMU2ENWyKQr9Hx9faYsEHNfoIFuzNmcRCEo8NrxY9SR7ntlZhZC?=
 =?us-ascii?Q?6HQALXjgWNyNv9wIKpUaZSJ4TJ0/zgkAR4rVIzApOx5k4Z+xZ4qMxbVfOUBF?=
 =?us-ascii?Q?06YmR9y0x2/ZJY195y22EcnJLX0dnpsZDDmDdphqsgLLCAH2Hc2McuNt4GiY?=
 =?us-ascii?Q?eEFpFNp1xFogfSdfFV+xFVhjZZ71BJzCDS65aDPpqrahMjgMQf5kQmuVyJKQ?=
 =?us-ascii?Q?rXfuh/H6rXU/e5O1ibhYU3UBG4qyuKORjwxWuwv0/+r3+J0SI1TPpsIDFsNy?=
 =?us-ascii?Q?HQDQOdIlHoOtQJmYYusfYfb83J3vlpy8tj7zhhX6uMYGUUTexOst45ZPmo3R?=
 =?us-ascii?Q?1cfDzXZwZOGzuHZIL0dNBIs26tql8XAMGUE9vBfIT9Yl9XgciERlTxxpwaRt?=
 =?us-ascii?Q?j+Z3ljLPr4WoezpnBhg3XryygRZCfQO9t5F1DrQKgRYzTf6FGxfvutECM0Ij?=
 =?us-ascii?Q?pcUc+jDwhm5sC3nmsUa9tAfrFO05jstB1Hads4gkhmicDbOaFjaShZOeI++y?=
 =?us-ascii?Q?RxnmjoI/R9HYJ2dMLWv0WbA0r8HeBnspYg4G2sRkCt1PbVsTXsa8Ib7mtAyK?=
 =?us-ascii?Q?ng3plvymUFkbIBIM1ZjstalBtw8NanS74u21Z/JkrHI6plm/9ZDEpPFx22pI?=
 =?us-ascii?Q?++MEXJ9cKyLQtcSb3CWf/fiYheK1n6VfTfUW/zV0LGsvJL3Y+nEeS5wbIlc8?=
 =?us-ascii?Q?ukoV8V9gEhrSBIhCuix41QUHyvPs/p18leLwPBGm934b/tpEQkuoT/sNKKAt?=
 =?us-ascii?Q?1ku1WrZJ0PHTTrkrlQ3gLlEcBoM0mlGICHnJL8JfzUb3GcKpibhL1s7OltGy?=
 =?us-ascii?Q?/g/irSo+mg6M/EVSrM8x1nAgVE4MvEfvFIAsCaxyx+5lWIElxCMkEraZRUKy?=
 =?us-ascii?Q?V9fT22FhG5KY4vbPEj2GRYxDOdX5T80gQUMFXk/D4Gn4eyy3AVV1tNFEf6ag?=
 =?us-ascii?Q?A/obNFSqgrdgvRB7MWZyJ2gzlLaO7ZC0AqqG3Y/MQbfHFuq9Xm4jgzuTxGmf?=
 =?us-ascii?Q?k2kplsBoRIUsfGr8V7/B/3Ip?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OBMGOh75c6FYCC4/Lollz5Uf6VkxGUx54faHQBxLmaradpL+fABxLQxY32pT?=
 =?us-ascii?Q?Buqizk6ay46RAi/tsy44dHSJMhYZHQjpdQe2CrxsluajgPn7v8aMbwLpU5sv?=
 =?us-ascii?Q?oh7bmV4raJZMZUCe1ZAR3YJ/SEz93rdUThTX51JBY2kvbfV8zIvQpI5r2OL3?=
 =?us-ascii?Q?+yqC7BgG+OAhnEtqm1i+cS5JsiusvSbONIpLTRQvqfDBySnC6piNAkDRqKgx?=
 =?us-ascii?Q?WABoymKEhN4HV6Vu3DUMi+x3om1H7itbogXUp2hUQJr2IfGX0HRFCSBp9vDJ?=
 =?us-ascii?Q?ADyA+GLo1ES8FtoNHLDLALzKtdnNEMlizFZybw/Xc5e7N5CL1GJ+hN3EwPFh?=
 =?us-ascii?Q?tcQiiPSRbUQhJR1aMtH9nxDa0Cvm2rJoFLaR0+K7pz7AyQ+AtXIejv8X9djW?=
 =?us-ascii?Q?Ajx2wLkovjQZPIS6Zngyv1DtfrkusC72m+jtKU++tb7bQRapkUp17mg9C5+A?=
 =?us-ascii?Q?H2oMS/x2h7+rZi5Go1WzrnXXsiG1J0ai0hjNDOFFnmfS9z4x0M40ZOQcmyQd?=
 =?us-ascii?Q?3BarnNNdd29TWFc229G2mD23PBCuxSt3neCIGiinjYtlpHhCjMy3l6hJArVe?=
 =?us-ascii?Q?EX2kbNbaFlWnMxKdL7tRTGisytxQkpocawkDllAJQA40WCYCyYndYSCeyMzz?=
 =?us-ascii?Q?POO4reGnXdzUMCVa8qZkU1W10LN2vBvFrRz4iI7kWE0dSwWqSisxj2R4NzCo?=
 =?us-ascii?Q?bmRvtsp2h7mV+skIUZRIKDAi0gTCSoSEnFRAY22mA8xBBgBDiPVmH3BkIjRv?=
 =?us-ascii?Q?MqjRRyfepEnCCU25G8daoSt5TiOoNquADjiKvTCleZtj1nC343LrXMblPyS8?=
 =?us-ascii?Q?9jt4pNOL7RlCLqQC0v8GYSVq+fldffZJsZfMdfOCAQ74Jpd8qEMkL92N6ldi?=
 =?us-ascii?Q?ZYAtN70+GQDzZFWZJX2xVvRkhBFZjwBUwUovNMP3lIXH+ru4Nx9Z8tse0Lyh?=
 =?us-ascii?Q?xLBatO13odgo34KawryQ4GuHBMDEnAFynblj6ib7TAMezP6331dhuKAJGCxG?=
 =?us-ascii?Q?PytHP2BPs6Em0JVrTK4hAsyTcY0R3dSoBaiBjk/MYjyU9VR1GmsGLD9jrq3y?=
 =?us-ascii?Q?ALTXPc3rzYGkrXED11/4fvb2nVPQwglVyTVk3LDaLOis4Uj/daIV7OIg4DEX?=
 =?us-ascii?Q?oxagqcvOIp4kghHbEy8tYa21avFPPA6fD9JKYCtlbeWmJy1B9OOiUukGe6rd?=
 =?us-ascii?Q?RSc8GOxhuf66tkgsWJBxOplGKQE/jPb96demn8IwPGjnE+StoQkJPlHqOTnt?=
 =?us-ascii?Q?j5Qi6cbytofnxouFLpzPena+SRqWHbovan6pC7a+Le+jIiCkcgA84xjJdF9Z?=
 =?us-ascii?Q?kiknQhjAETSzhXviNqDwzMylao+OIX8VC9S4jol4HWypeOaGhGs5TF5LOEUj?=
 =?us-ascii?Q?g1ye5s/AJV8wy5DpTSfBiNYZ011yl1bkASvk4jriMjwJN1A92LNzAqsAkN0g?=
 =?us-ascii?Q?qHxy+JeIYi9jIAFrFbbL5uDIuJIzQPCRkNf0f9z2ravwO9a/Igrfra55FLDP?=
 =?us-ascii?Q?iBHtQGtCaceKXqPGWpRc+Dz1mx/eiqYfVVn70jhqRe3HcJIQJQ8KuN7NK+oZ?=
 =?us-ascii?Q?VLiQyVvnaj+LKy4NmrYpOrCYfIG2a1LTKofC02H7kQmXTmSsKrYnia3g/EP/?=
 =?us-ascii?Q?dQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bad08249-a432-4b80-85ce-08dd04b5ace5
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 14:07:29.5003 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4cevsloi2XoJQHf8ygUb4hyd7Ebv6CKtExDSM5P09JSb6iCz75759BIoEnv8yGZgMFjkPSDG7go8zCnyqfcBBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6098
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

On Thu, Nov 14, 2024 at 07:07:38PM +0530, Balasubramani Vivekanandan wrote:
> Driver returns from the ccs_mode change request soon after initiating an
> asynchronous GT reset. Userspace may submit GT workload while the GT
> reset is ongoing and may see unexpected results.
> Make sure the GT reset is complete before exiting from the ccs_mode
> change request.
> 
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> index b6adfb9f2030..9b6c15239487 100644
> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> @@ -150,7 +150,7 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>  		xe_gt_info(gt, "Setting compute mode to %d\n", num_engines);
>  		gt->ccs_mode = num_engines;
>  		xe_gt_record_user_engines(gt);
> -		xe_gt_reset_async(gt);
> +		xe_gt_reset_sync(gt);

This creates a massive locking dependency chain of:

drm.filelist_mutex -> every single lock in a GT a reset which is a bit
scary. 

Does lockdep complain? Even if it does, anyway this could moved outside
of the drm.filelist_mutex?

Matt

>  	}
>  
>  	mutex_unlock(&xe->drm.filelist_mutex);
> -- 
> 2.34.1
> 
