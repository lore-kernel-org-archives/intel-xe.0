Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DBBAC61CE8
	for <intel-xe@archiver.kernel.org>; Mon,  9 Jun 2025 21:28:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F17FE10E1A6;
	Mon,  9 Jun 2025 21:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BnA2jy8T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DE4F10E1A6
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Jun 2025 21:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749504520; x=1781040520;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=XqY9PXnOdOFDrK6Q3bMpWBzFmfkWRB0MIMRxnRrWha4=;
 b=BnA2jy8Tf6vo162W7WeUZ9yTNw8m4zO4uND26bRx2ZSzKV2YCm6znQD+
 EJqRejqPTJGB8R0rUmdxUxtM68/G2ajOF9OTQgpYTR8Q3WdL20OyVq+bg
 xXAsubncuiNb/+ZNOyfGGOUu1cgUe8tY+pCe8ThQ7XEpZEyNTnU68Klz+
 rM7RRt6p4UXFfi40sI3vCO1/FVJEoYjDmTARK3OQws9H9l+klaHmb9GZB
 OUkJ+dqZLsdvyPAX6hPbNP8a2tKwCTjtVqU/JE+4g+x3QOXZcwP+F6DdJ
 +FNRUaTiKRH3awROSsWkeAWEp4+x521wjY7uDbh6EsBDkiOyJuGiSfA/1 w==;
X-CSE-ConnectionGUID: UcL7L50eS4yUTJHjmfTiIQ==
X-CSE-MsgGUID: rEPj5sfwSQmWd+DjeBUbXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="74132259"
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; d="scan'208";a="74132259"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 14:28:40 -0700
X-CSE-ConnectionGUID: RgRP14NwSLOpY2lxRMuTNw==
X-CSE-MsgGUID: vEtdObaUSoWTVsYSka9/fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; d="scan'208";a="146616330"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 14:28:40 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 14:28:39 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 14:28:39 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.80) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 14:28:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JmjzJRdPjaFejDUKogzBjkyFj/kAeYZf1MZX7laHPBd5UCAX6gW3kuSKDOpTIHZLmbgHdUbNHmGbZgssrIjfLhxVoDi0kAoDkCsUCCuV2tUTIAnFz1xXCl6syQ7lQro4o/NAWzMOoYJbPicwkGj4px6ZSyqecbBPc+vFA+pT7zgOe72isPKoor5ZmdmnkKaq+uHdHkM/BzyhUtgHX8vihQJoGQkWbif7wY3QVWcSh/wZa6Ahut/0gQFpFjzFUHMS4oCjgC1eW9Vcp4Z+EqwCD6Z8GUOe7vzYCurW6kwB+MxBXSbKYmkDeo7OnQtZXg8a4GWlCfy5rtnFf5IYB9R5Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQCXrrSZvhgpKhUzxVi7cYTM5LwBpoJ8vmFssV2UIvk=;
 b=mKSqqV8V+lllYppXEAJP4cqsdvztHDasKhkjZ/EjEMpcC3G2T/KTKy9TIQB/ElDDWM0oY9urhxONP2YW58FkvFuIrCc8xccDafKCIcE7/cCd3oSAuMkx6MJQDaczHdYO3hRn/2idlq44IW6xRD0gcutrjqeBWmbLumGRp7RiVFRIAv4dRJffSDrPM3iRFoLayfOeenMiW7eUm5IBs6NrGJzOGFhvzEe1q5gGsi6ovT0u7LKhltTuDHw+ZLLm25ywSOIHebP4sc6prTTaKqUDSGPMbn/SmIwti+4aW2oKFXEtWHbmozElpVEbl5Pzbm/2cI7Cd1vossI2sQYukf0toQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB5230.namprd11.prod.outlook.com (2603:10b6:5:39a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.29; Mon, 9 Jun
 2025 21:28:37 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 21:28:37 +0000
Date: Mon, 9 Jun 2025 14:28:34 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 2/4] drm/xe: Promote struct xe_mmio definition to own file
Message-ID: <20250609212834.GQ5080@mdroper-desk1.amr.corp.intel.com>
References: <20250603202826.681-1-michal.wajdeczko@intel.com>
 <20250603202826.681-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250603202826.681-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY1P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::8) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB5230:EE_
X-MS-Office365-Filtering-Correlation-Id: eb81bf33-4dff-43e0-bd62-08dda79c9854
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?oSZSnSTll2dJCGSlTiA22KhPjW3LeBj/WnEKffL6ve20+zR1l3SgQCSqTa?=
 =?iso-8859-1?Q?AB9wMNWLUOyNO71LNxWaLd7F/fWAZK7BGf/wnGRfzDaMVGHV19Qiw4eA6W?=
 =?iso-8859-1?Q?UQ/Qwr77QQcj8xG/NHdjxLI+xFYsYQ2w3Ek3pGvppddPkbB53cBr1d1Lp/?=
 =?iso-8859-1?Q?PGnsd/9L/EvicgiV5FfDKqAASoNshX/KpMACyjMgZhN+yuXq2t2mUzblBR?=
 =?iso-8859-1?Q?2RiwflGlSmuQM6mQcH2Dtv+nNKtTckm4QV0Q5nxsRiqw/XBv2Ipuq/tE7u?=
 =?iso-8859-1?Q?VnQU5Hu9H4/ljYezm7a44Vq6Imm0m4faOPt2UK4r1cQdq13LqFdFcjAW4G?=
 =?iso-8859-1?Q?yHMyFXMbVzo7YX0GRjGIBp+SzKMQL23eTEiqlJF6NqH8ore/SUXW4HMOtS?=
 =?iso-8859-1?Q?ymciCcio9u5SSoS2wCXEJ4HnqHT6py7K+P4H/GO/uJ+HWePoIZTq1Lz4qX?=
 =?iso-8859-1?Q?mtyJcW85RtKxN1Xuj8Avnoed6UkwZ0lXKRwe/0NTvIYpjILZ74iXEd5gK1?=
 =?iso-8859-1?Q?/s4cRTKKVFsHrVKyotUryvgpGza7mEq9dIsZFZKrKXfdutadgtouAu10fi?=
 =?iso-8859-1?Q?cWaCdRcvXLZ+gGLgIJJXdshAw2yA7eVglZzryO4fAVg8lPhNvbc1W/d/2D?=
 =?iso-8859-1?Q?IJiPULI1mxuq1H3nSt6ngJYo1kxifqeeEOjkhyo23jo//WrpFHMDjZSEiv?=
 =?iso-8859-1?Q?NdmfHQOXUWQ4AXz+g+bDf1SguxuaX/MlB0AX5NiJ9Rcerm3enoe0fDHmPV?=
 =?iso-8859-1?Q?+1NFmfpuQyJOqDSnUfJd8QgTA0DgGNw9ae38AvDnys5KpsvXP6CNHWzOSc?=
 =?iso-8859-1?Q?1Rt23a7qzij6rBof+44Rxsh/JIJJKZp31s8w0/fEFiRfoWwORv+tqpgdxF?=
 =?iso-8859-1?Q?+orYN+6p1Q+DpdKoIXoizSq2bNSbBS4+s/Zcii3C2mfrTKc/gNiCTe3e4P?=
 =?iso-8859-1?Q?5FMWH2nffiQ3SDvYactSUZItAXNSPfD6QMdOu3tTKVFAYhnN0hNb/J6Lbp?=
 =?iso-8859-1?Q?c8UiDofwavxxDjyAaGqwO64Itd2lc6YszKA36UsH/MfxC5KwQ7q4IYY3er?=
 =?iso-8859-1?Q?4wLOwPw7BU5989VmfeVRc1MgoyGSZZTz5gHc1ny3h0omjaDgv7JTrtFwm1?=
 =?iso-8859-1?Q?MytZpr7b7xmChg324X/aTwU3rO8pds+TEyiTwkBobfiXK+ztkljKo9c0UK?=
 =?iso-8859-1?Q?IU3xQhsXR/R48yI1l6mtr9otHKPhFbi0zyvLCXZOCVWMRpR1xdwLCyMPZ1?=
 =?iso-8859-1?Q?QvLKRFWrMw8HDZLDcosiWV+HuNvms8N62dKOB7sCbqU/gJazZ5CR0DV3nE?=
 =?iso-8859-1?Q?0vrfbo93E4zfGPIAbkpRGiezNFLmalwF4tZ68mGqxN87/dqT3ia6AopCVG?=
 =?iso-8859-1?Q?CRv3uZzCUIX6Fp7OL0dyR0sOcKTWnDcVTWuiQc/Vx+ILcG+R2thfpKDc1G?=
 =?iso-8859-1?Q?988N+rf2vG6AACdxPy3NVfh27KKspzK8BQrnMDM8HIUGtMIbqL75xsSkp3?=
 =?iso-8859-1?Q?Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?kj5xv0MTDPm0wGrwjUXtwBebzDR7qjQqabZqOCqDZttt3eVnzCaajObIOo?=
 =?iso-8859-1?Q?05paZM4V2+O+acrOzlJEud1Ntiic3cVrpl+9PClR5AihkNnd5A+gpkLjYZ?=
 =?iso-8859-1?Q?Ng0RpAfQ4PkR8ASGXy5xAiaDzmBSP5ff3pyZmGdOOUR3ZHIDFrMkQIns3D?=
 =?iso-8859-1?Q?OmY/Cv37sb+0MC7Snp6ltt2ReVldlwFEVjJ6WYV7BmjnCgOhgHeeBBTuOG?=
 =?iso-8859-1?Q?bQnJdycVHZ2FSkyVEPJGilQeNTOt+6IGpLJdKxY1Svd4MiN/2+hzcjKPl4?=
 =?iso-8859-1?Q?HGYZEFx/E1n8fymlNAK+nXOH9dPO5xt5/qjwFrOlFL3Q4uh46ocEOiHnN4?=
 =?iso-8859-1?Q?ox6bfINpAV5sBm6x9Zpgy1cZoESdVa2I1JaIisSeu0kv4mGk9VrizW2Lvw?=
 =?iso-8859-1?Q?1S5hmCPPT5CpqAO931QVbZNy03Vdjw5gPnMc4ha0IRtcNvMt3E0w0IWi+H?=
 =?iso-8859-1?Q?pcEGlU5fHcfpezGn9qc5zzLDE2VU/pPMQbFgtUv/ySWDU1vi0DCAr45W2d?=
 =?iso-8859-1?Q?J/xNAso0oQaFDGNp60uIuy6pY10sAbBUoJFQA/4KDfgSciLhJp9afZig98?=
 =?iso-8859-1?Q?wX4SJePxvJERU+zokVZh9I+KvlaH0TMbFX0HkWdTd4TfENQ4ff59xi+WFJ?=
 =?iso-8859-1?Q?k+RhpQnGwOTKRV0g1Sx0hfqOdR/MdwN0nf4n82wgjOABcVvFHyAmLe19Ja?=
 =?iso-8859-1?Q?MFwUB8OtbRVCKfm5AuHDJemgIfAtosjJUmkLpw9YIO/ICjyKAZPlobD0WL?=
 =?iso-8859-1?Q?kmlDtA0aJm3qnFPhMX1enXjPKv/FITalCHG3Ikzz1/2liwcb7peU8vrtTA?=
 =?iso-8859-1?Q?qvSF4yNy5Qt6NEMk/gbmqRQ18pKDLSJcmkjhwUOgrpWdUqS4o7LXvvyjnu?=
 =?iso-8859-1?Q?4tiw8qskjux+U++XnHvGz0KX1yU3amvftuDhqOc1ty75m24YZnn+Rz04Ru?=
 =?iso-8859-1?Q?FBFxa4FhtVofBcox/z/9ghK6Gqbfnj6tpJGqSa3WWa3aDnSGCWP24e7MgJ?=
 =?iso-8859-1?Q?p80c+/WEzTSLvxv4VbxmaX57sUBbiTK5shZ6yRN+XPCpLEjB2Lo07wP8Ux?=
 =?iso-8859-1?Q?aJC86kuKcQbPGAnLZbZfbKmHNob2XoYq83G8MWPpSVbUkDQ3iMoUQqN9gr?=
 =?iso-8859-1?Q?PFcjJW848g7eHPf9ULsCiaafkUmro/rEBaCw6bdaC5/33Ffy40V8yP/DfQ?=
 =?iso-8859-1?Q?dZRilawjhCJMw+jdoewarEP8xphdjeMV/JODQ3UG1WCfTR/LxP/F3CPOiN?=
 =?iso-8859-1?Q?GQoXz6qthfvUqMu+v8gewRWKHgknWb2SA/DbqVj4FlTFXwW9kIDG3dBAZp?=
 =?iso-8859-1?Q?Dek2JhhcowQU2UynJI+b50iCN/HXh9AwQk7rCSI47jq8/uh1sKcEqpjVw3?=
 =?iso-8859-1?Q?yfQE523gh71aT8U7f4p4PEemJreLo0mWwlHqO+5TUkc3rNpsb2hGLxYICl?=
 =?iso-8859-1?Q?yBsy0neGQT+7TMx5w6R1YJA5/JsOzgHVN8dpn6qDzgHqlQSJMAef4yoemt?=
 =?iso-8859-1?Q?uO+Fsl3Hb0DqA/i+l6nRdDH5vBVePuwvwi/BuHmtGTKncqdJGm4YG5QFlb?=
 =?iso-8859-1?Q?os+8nIP0jup2oM23fh6HyxoCtRsEBJREhe1zSnlZ+fb5tBDAjIEsxi3kiy?=
 =?iso-8859-1?Q?CMqwa/uo/QbJiRFfooW8LZaisqjruTmQF8Y6yyCjW/UHJOnM+yza1hjg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eb81bf33-4dff-43e0-bd62-08dda79c9854
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 21:28:36.9761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WQxkxp0xeV9pDuamW1Derx4gVwTC/lHkVewmIrKjc3gWn+nYsP1sVxbR97X9aYpfHBBZuDvxtsAeNyI2Y/cE9mhcjdo5/py9Enp9CKgddss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5230
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

On Tue, Jun 03, 2025 at 10:28:24PM +0200, Michal Wajdeczko wrote:
> We already have separate .c and .h files for xe_mmio functions,
> time to introduce _types.h to follow what other components do.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 40 +--------------------
>  drivers/gpu/drm/xe/xe_mmio.h         |  3 +-
>  drivers/gpu/drm/xe/xe_mmio_types.h   | 53 ++++++++++++++++++++++++++++
>  3 files changed, 56 insertions(+), 40 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_mmio_types.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index b93c04466637..831dd88a4c52 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -17,6 +17,7 @@
>  #include "xe_heci_gsc.h"
>  #include "xe_lmtt_types.h"
>  #include "xe_memirq_types.h"
> +#include "xe_mmio_types.h"
>  #include "xe_oa_types.h"
>  #include "xe_platform_types.h"
>  #include "xe_pmu_types.h"
> @@ -121,45 +122,6 @@ struct xe_vram_region {
>  #endif
>  };
>  
> -/**
> - * struct xe_mmio - register mmio structure
> - *
> - * Represents an MMIO region that the CPU may use to access registers.  A
> - * region may share its IO map with other regions (e.g., all GTs within a
> - * tile share the same map with their parent tile, but represent different
> - * subregions of the overall IO space).
> - */
> -struct xe_mmio {
> -	/** @tile: Backpointer to tile, used for tracing */
> -	struct xe_tile *tile;
> -
> -	/** @regs: Map used to access registers. */
> -	void __iomem *regs;
> -
> -	/**
> -	 * @sriov_vf_gt: Backpointer to GT.
> -	 *
> -	 * This pointer is only set for GT MMIO regions and only when running
> -	 * as an SRIOV VF structure
> -	 */
> -	struct xe_gt *sriov_vf_gt;
> -
> -	/**
> -	 * @regs_size: Length of the register region within the map.
> -	 *
> -	 * The size of the iomap set in *regs is generally larger than the
> -	 * register mmio space since it includes unused regions and/or
> -	 * non-register regions such as the GGTT PTEs.
> -	 */
> -	size_t regs_size;
> -
> -	/** @adj_limit: adjust MMIO address if address is below this value */
> -	u32 adj_limit;
> -
> -	/** @adj_offset: offset to add to MMIO address when adjusting */
> -	u32 adj_offset;
> -};
> -
>  /**
>   * struct xe_tile - hardware tile structure
>   *
> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> index 540bade24790..4e794757b020 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.h
> +++ b/drivers/gpu/drm/xe/xe_mmio.h
> @@ -6,9 +6,10 @@
>  #ifndef _XE_MMIO_H_
>  #define _XE_MMIO_H_
>  
> -#include "xe_gt_types.h"
> +#include "xe_mmio_types.h"
>  
>  struct xe_device;
> +struct xe_mmio_range;
>  struct xe_reg;
>  
>  int xe_mmio_probe_early(struct xe_device *xe);
> diff --git a/drivers/gpu/drm/xe/xe_mmio_types.h b/drivers/gpu/drm/xe/xe_mmio_types.h
> new file mode 100644
> index 000000000000..67c535dd1248
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_mmio_types.h
> @@ -0,0 +1,53 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2022-2025 Intel Corporation
> + */
> +
> +#ifndef _XE_MMIO_TYPES_H_
> +#define _XE_MMIO_TYPES_H_
> +
> +#include <linux/types.h>
> +
> +struct xe_gt;
> +struct xe_tile;
> +
> +/**
> + * struct xe_mmio - register mmio structure
> + *
> + * Represents an MMIO region that the CPU may use to access registers.  A
> + * region may share its IO map with other regions (e.g., all GTs within a
> + * tile share the same map with their parent tile, but represent different
> + * subregions of the overall IO space).
> + */
> +struct xe_mmio {
> +	/** @tile: Backpointer to tile, used for tracing */
> +	struct xe_tile *tile;
> +
> +	/** @regs: Map used to access registers. */
> +	void __iomem *regs;
> +
> +	/**
> +	 * @sriov_vf_gt: Backpointer to GT.
> +	 *
> +	 * This pointer is only set for GT MMIO regions and only when running
> +	 * as an SRIOV VF structure
> +	 */
> +	struct xe_gt *sriov_vf_gt;
> +
> +	/**
> +	 * @regs_size: Length of the register region within the map.
> +	 *
> +	 * The size of the iomap set in *regs is generally larger than the
> +	 * register mmio space since it includes unused regions and/or
> +	 * non-register regions such as the GGTT PTEs.
> +	 */
> +	size_t regs_size;
> +
> +	/** @adj_limit: adjust MMIO address if address is below this value */
> +	u32 adj_limit;
> +
> +	/** @adj_offset: offset to add to MMIO address when adjusting */
> +	u32 adj_offset;
> +};
> +
> +#endif
> -- 
> 2.47.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
